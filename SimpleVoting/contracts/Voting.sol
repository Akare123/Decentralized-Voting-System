// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SimpleVoting
 * @dev A simple smart contract for creating and managing on-chain votes.
 */
contract SimpleVoting {
    // Address of the contract administrator
    address public owner;

    // A mapping from a candidate's name to their vote count
    mapping(string => uint256) public votes;

    // A mapping to track which addresses have already voted
    mapping(address => bool) public hasVoted;

    // A dynamic array to store the names of all candidates
    string[] public candidates;

    // Event to be emitted when a vote is successfully cast
    event Voted(address indexed voter, string candidateName);

    /**
     * @dev Modifier to restrict function access to the contract owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    /**
     * @dev Sets up the contract with an initial list of candidates.
     * @param _candidateNames The initial list of candidates for the vote.
     */
    constructor(string[] memory _candidateNames) {
        owner = msg.sender;
        candidates = _candidateNames;
    }

    /**
     * @dev Allows a user to cast their vote for a specific candidate.
     * @param _candidateName The name of the candidate to vote for.
     */
    function vote(string memory _candidateName) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(isCandidate(_candidateName), "This is not a valid candidate.");

        hasVoted[msg.sender] = true;
        votes[_candidateName]++;

        emit Voted(msg.sender, _candidateName);
    }
    
    /**
     * @dev Allows the owner to add a new candidate to the election.
     * @param _newCandidateName The name of the new candidate.
     */
    function addCandidate(string memory _newCandidateName) public onlyOwner {
        candidates.push(_newCandidateName);
    }

    /**
     * @dev A helper function to check if a name is a valid candidate.
     * @param _name The name to check.
     * @return bool True if the name is in the candidates array, false otherwise.
     */
    function isCandidate(string memory _name) private view returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            // Solidity does not have a direct string comparison operator,
            // so we compare their keccak256 hashes.
            if (keccak256(bytes(candidates[i])) == keccak256(bytes(_name))) {
                return true;
            }
        }
        return false;
    }

    /**
     * @dev Returns the list of all candidates.
     */
    function getAllCandidates() public view returns (string[] memory) {
        return candidates;
    }
}
