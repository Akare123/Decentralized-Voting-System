# Simple On-Chain Voting System

A basic, decentralized voting smart contract built with Solidity. This project demonstrates fundamental blockchain concepts and is a great starting point for anyone new to smart contract development.

## Description

This contract allows an "owner" (the address that deploys the contract) to create a vote with a predefined list of candidates. Any other address can then cast a single vote for one of the candidates. The system ensures that each address can only vote once.

## Features

-   **Owner-Managed:** The contract deployer has administrative privileges.
-   **Candidate Management:** The owner can add new candidates.
-   **One-Person, One-Vote:** Each Ethereum address is permitted to vote only once.
-   **Transparent Results:** Anyone can query the contract to see the current vote count for any candidate.
-   **Event-Driven:** Emits a `Voted` event whenever a new vote is cast.

## Concepts Demonstrated

-   `mapping`: For efficient lookups of vote counts and voter status.
-   `array`: To store the list of candidates.
-   `modifier`: An `onlyOwner` modifier for access control.
-   `constructor`: To initialize the contract state.
-   `require()`: For input validation and enforcing rules.
-   `event`: For logging important actions on the blockchain.
-   `keccak256`: For comparing strings within the contract.

## Getting Started

### Prerequisites

-   An Ethereum development environment like [Remix IDE](https://remix.ethereum.org/), [Hardhat](https://hardhat.org/), or [Foundry](https://getfoundry.sh/).

### Usage with Remix IDE

1.  Open [Remix IDE](https://remix.ethereum.org/).
2.  Create a new file `Voting.sol` and copy/paste the contract code.
3.  Go to the "Solidity Compiler" tab and compile the contract.
4.  Go to the "Deploy & Run Transactions" tab.
5.  In the "Deploy" section, you need to provide the initial candidates as a string array. For example: `["Alice", "Bob", "Charlie"]`.
6.  Click "transact" to deploy the contract.
7.  Once deployed, you can interact with the contract's public functions:
    -   Use `vote` with a candidate's name (e.g., "Alice") to cast a vote. Switch to a different account in Remix to cast another vote.
    -   Use `votes` to check the current vote count for a candidate.
    -   Use `addCandidate` from the owner's account to add a new option.

## License

This project is licensed under the MIT License.
