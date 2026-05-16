## Project Overview
A time lock smart contract is a secure vault for your digital assets that restricts withdrawals until a specific future date or block number. </br>
* It acts as an automated, tamper-proof safeguard, ensuring funds cannot be accessed early, which is ideal for long-term holding, vesting schedules, or executing delayed transaction.

##  Features
* ****Ether Deposit Support:**** The contract can receive ETH directly through the `receive()` function.
* ****Deposit Event Logging:**** Emits a `Deposit` event whenever ETH is sent to the contract.
* ****Withdrawal Event Logging:**** Emits a `Withdraw` event after successful withdrawal.
* ****Reentrancy Protection:**** Implements a custom reentrancy guard using a `locked` boolean. Prevents malicious recursive withdrawal attacks.
* ****Custom Errors (Gas Efficient):**** Uses Solidity custom errors instead of revert strings. Saves gas and improves readability.
* ****Balance Checker Function:**** Users can check the contract’s ETH balance.
* ****Low-Level Call for ETH Transfer:**** Uses `.call{value: amount}("")` for transferring ETH.
* ****Validation for Lock Time:**** Prevents deployment with a zero lock duration.
* ****Immutable Variables:**** `i_owner` and `i_unlockTime` are declared as `immutable`. Saves gas because values are assigned once in the constructor and never changed.
* ****Owner-Only Withdrawals:**** Only the deployer of the contract can withdraw funds. Protected using the `onlyOwner` modifier.
* ****Time-Locked Withdrawals:**** Funds cannot be withdrawn until a specified unlock time. The unlock time is set during deployment using _secondsToLock. Uses Unix timestamps with block.timestamp.

##  Key Concepts Applied
* ****Modifier:****  Access-Control for `onlyOwner` of the locked contract to only be able to access the details. And also `nonReentrant` modifier, that helps to prevent double funding while a specific funds has already been locked.
* ****Immutable Variables:**** Values assigned once in the constructor and cannot be changed afterward.
* ****Constructor:**** Runs once during deployment to initialize the contract.
* ****Custom Errors:**** Gas-efficient error handling.
* ****Access Modifiers:**** Controls visibility of variables and functions.
* ****Events:**** Used for logging blockchain activity.
* ****Indexed Event Parameters:**** Makes event data searchable in logs.
* ****Address Type:**** Represents Ethereum wallet or contract addresses.

##  Project Structure (Files)
* ****TimeLockWallet.sol`****: The main contract implementing receivce, getBalance and withdraw functions.
* ****TimeLockWallet.t.sol`****: Unit Test (suite) containing tests to validate contract functionalities.

## Technology Stack (Technologies Used)
* ****[Solidity](https://www.soliditylang.org/)**** - The programming language for writing the Smart contracts.
* ****[Remix IDE](https://remix.ethereum.org/)**** - used it to write, and deploy the smart contract directly in the browser first. A fastest way to get started, acting as a "no-setup" workshop for smart contract development. 
* ****[Foundry(forge, cast, anvil)](https://www.getfoundry.sh/)****  -  Development framework and testing suite.
* ****[Visual Studio Code](https://code.visualstudio.com/)**** - Install this IDE only if you are using foundry development kit rather than "Remix IDE" which is for quick prototying.


## Getting Started

### Prerequisites

### Recommendation (For Beginners)

## Usage 

### Building the Project (Using Remix IDE):

### Building the Project (Using Foundry Development Kit ) - only if you are good using foundry kit

## Contract Details
### Functions:

### Variables:

## Usage Guide (How to use - When using Remix IDE by interacting with the deployed contract) 
1. ****Compile:**** Compile the contract.
2. ****Deployment:**** Deploy contract
3. ****Deposit:**** Use a `low level interaction` depositing format which is being used on remix to send Eth to the address.
4. ****getBalance:**** You can check the balance of your wallet as an authorized owner  and it will display your current balance after funding.
5. ****withdraw:****  Withdrawal can be down after the time lock duration has elipsed . Then it will be possible to withdraw the funds.

### How It Works
* ****Lock:**** The sender deposits tokens or funds into the smart contract.
* ****Specify:**** A strict unlocking condition is set (either a specific timestamp, or a block number).
* ****Release:****  The funds remain locked and untouched until the condition is met. Once the time expires, the designated beneficiary can withdraw the assets.

## Why This Matters (Time Lock Smart Contract)
Time-lock smart contracts are vital in Web3 because they introduce `predictable delays and automated waiting periods` to the blockchain. Because smart contracts run on exact code, time locks  to the blockchain. Because smart contracts run on exact code, time locks enforce discipline, prevent immediate admin abuse, and create trustless safety windows. </br>
They matter immensely in Web3 blockchain systems for several reasons:
1. ****Prevents Impulsive Selling:****  Acts as a forced "hodl" or time-locked wallet. By locking your tokens for a set period, it removes the temptation to panic-sell during market crashes.
2. ****Automated Trustless Escrow:**** Replaces the need for a third party (like a lawyer or bank) in agreements. Funds are only released when the predetermined time lock or set of conditions is met.
3. ****Wills and Inheritance:**** Can be used as a "smart will". You can lock your crypto and set a release date for a family member or heir, completely bypassing the traditional probate court process.
4. ****Safe Protocol Upgrades:**** In Web3, smart contract upgrades can be risky. Timelocks introduce a mandatory waiting period for administrative operations. This gives developers a safety window to detect anomalies and roll back changes if necessary before they cause harm.
5. ****Community Reaction Time:**** Many Decentralized Autonomous Organizations (DAOs) and DeFi protocols (like PancakeSwap) enforce a timelock delay on governance votes. If the DAO passes a drastic upgrade, this buffer ensures investors are warned and have time to withdraw their assets before the changes take effect.

## Key Use Cases of Time Lock Smart Contracts
* ****Vesting & Team Tokens:****  Prevents founders or investors from selling their allocated tokens immediately by locking them for days, months or years.
* ****Long-term Savings (HODLing):**** Acts as an enforced digital piggy bank to protect you from impulsive trading decisions.
* ****Delayed Execution:**** Used in decentralized autonomous organizations (DAOs) to lock in governance votes, allowing community members time to review and respond to proposed changes.

## Core Benefits
* ****Trustless Security:**** Operates entirely on code without relying on a third-party intermediary, escrow agent, or bank.
* ****Immutability:**** Once the rules are deployed to the blockchain, they cannot be altered or bypassed by anyone, guaranteeing the terms will be met exactly as written.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of (Some include):

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).

## Documentation

https://book.getfoundry.sh/

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

## Author
Built with ❤️ by [@legendarycode3](https://github.com/legendarycode3/)  </br>
Part of my  `60 Days of Solidity extensive Challenge`

##  If you find this project helpful,then link back to this repository. 
`I Appreciate`
