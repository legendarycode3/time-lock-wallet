# Time Lock Smart Contract
A secure timelock smart contract that enforces delayed execution of privileged actions, governance proposals, and critical protocol operations, providing transparency and security through mandatory waiting periods before state changes occur.

 
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
* ****Low-Level Call:**** Used to send Ether safely.
* ****Function Visibility:**** Different visibility levels are applied:
* ****Blockchain timestamps:**** Uses blockchain timestamps. Used for `Locking funds` and `Withdrawal timing`.

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
* Solidity Compiler, Version ^0.8.19 or higher.
* `Remix IDE` or `Foundry Development Kit`

### Recommendation (For Beginners)
****NOTE (Use Remix IDE, for quick prototyping):**** You can literally just copy the main contract source code and paste it on Remix IDE and learn along side how the code works while trying to build yours as you keep building. 

## Usage 
### Building the Project (Using Remix IDE):
1. Copy the core smart contract file code `StudentRegistry.sol` to Remix IDE (a browser based IDE, for quick prototyping).
2. Create a new file for the project on your Remix IDE and paste , to learn and build along faster.
3.  And then Compile the smart contract file you have created on Remix IDE.

### Building the Project (Using Foundry Development Kit ) - only if you are good using foundry kit
1. Clone the repository:
    ```shell
    git clone https://github.com/legendarycode3/student-registry-smart-contract
   ```
2. Navigate to the directory you created and cloned the file to:
   ```shell
      cd student-registry-smart-contract
    ```
3.   Compile the smart contract:
   `forge build`

### Testing the contract (Using Foundry Development Kit ) 
Runing all tests:
  ```shell
    forge test
  ```
Runing specific test:
  ```shell
     forge test --mt testFunctionName
  ```

## Contract Details
### Functions:
* ****`constructor()`****: Function that sets the owner of the contract.
* ****`receive()`****: Function that Accept Ether directly.  It Allow ETH to be sent into the contract.
* ****`getBalance()`****: Function that allows the contract owner to see the balance left.
* ****`withdraw()`****: Function that allows withdrawal to be done after the funds is unlocked. Just for authorized identity.

### Variables:
* ****`i_owner`****: Stores the address of the contract deployer
* ****`locked`****: Variable that prevents reentrancy guard to prevent reentrancy attacks on the withdrawal function.
* ****`i_unlockTime`****: Stores  the time at which the funds can be withdrawn using unix timestamp.

## Usage Guide (How to works - When using Remix IDE by interacting with the deployed contract) 
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
* ****Token Vesting:**** Time-lock contracts are used to release tokens gradually to founders, team members, and advisors over a predefined period. This prevents immediate selling and encourages long-term commitment to the project.
* ****Investor Lockups:**** Projects often lock tokens allocated to early investors after fundraising events. This reduces the risk of large-scale token dumps and helps maintain market stability after launch.
* ****DAO Governance Timelocks:**** Decentralized organizations use timelocks to delay the execution of approved governance proposals. This gives community members time to review decisions and respond to potentially harmful changes.
* ****Treasury Management:**** Organizations and DAOs lock treasury funds so that withdrawals or expenditures can only occur after a specified waiting period. This improves transparency and reduces the risk of misuse.
* ****Escrow Services:**** Funds can be locked until a specific date or condition is met. Once the agreed conditions are satisfied, the contract automatically releases the funds without requiring a trusted intermediary.
* ****Decentralized Savings Plans:**** Users can lock cryptocurrency for a fixed duration to encourage long-term saving. Funds remain inaccessible until the lock period expires.
* ****Inheritance and Estate Planning:**** Digital assets can be programmed to transfer to designated beneficiaries after a certain period or event, enabling automated inheritance management.
* ****Scheduled Payments and Payroll:**** Businesses can use time-lock contracts to automate salary payments, grants, or recurring disbursements that are released at predetermined intervals.
* ****Staking and Yield Farming:**** Many blockchain protocols require users to lock their assets for a specific period to earn rewards. Longer lock periods often provide higher incentives.
* ****Cross-Chain Atomic Swaps:**** Time-locks are a core component of Hashed Timelock Contracts (HTLCs), which enable trustless asset exchanges between different blockchains while ensuring funds are returned if conditions are not met.
* ****Wallet Security and Recovery:**** High-value wallets can use timelocks to delay withdrawals or administrative actions. This creates a security buffer that allows suspicious transactions to be detected and stopped before execution.
* ****Crowdfunding and Milestone-Based Funding:**** Raised funds can be locked and released only when project milestones are achieved or specific deadlines are reached, increasing accountability for project teams.
* ****Liquidity Locking:**** Blockchain projects often lock liquidity pool tokens for a fixed period to demonstrate commitment and reduce concerns about liquidity withdrawal or "rug pulls."
* ****Grants and Scholarship Distribution:**** Educational institutions, foundations, and organizations can schedule

## Core Benefits Time Lock Smart Contracts
* ****Trustless Security:**** Operates entirely on code without relying on a third-party intermediary, escrow agent, or bank.
* ****Immutability:**** Once the rules are deployed to the blockchain, they cannot be altered or bypassed by anyone, guaranteeing the terms will be met exactly as written.
* ****Delayed Execution Protection:**** Critical actions cannot be performed instantly, giving stakeholders time to review proposed transactions before they take effect.
* ****Reduced Centralization Risk:**** Prevents administrators from making immediate unilateral changes, encouraging accountability and decentralized oversight.
* ****Increased User Trust:**** Users can verify that protocol upgrades and administrative actions will not occur without prior notice.
* ****Transparency:**** All queued transactions are visible on-chain before execution, allowing anyone to monitor upcoming protocol actions.
* ****Emergency Exit Window:**** Provides users with time to respond, withdraw funds, or take protective actions if a harmful proposal is approved.
* ****Decentralization Support:**** Encourages accountable governance by preventing immediate unilateral control over protocol operations.
* ****Predictable Change Management:**** Users know when protocol changes are scheduled to occur, improving reliability and planning.
* ****Modular Security Layer:**** Can be integrated with DAOs, multisig wallets, treasury contracts, and upgradeable smart contracts to strengthen overall protocol security.



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

## Appreciate 
If you find this project helpful, please consider linking back to this repository. `I appreciate` your support

