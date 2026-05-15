// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title   Time Lock Wallet
 * @author  Legendary Code
 * @notice   A wallet that restricts withdrawals until a certain date.
 */


contract TimeLockWallet {

          /* State Variables */
   /// @notice The address of the contract deployer
   address public  immutable  i_owner;

    /// @notice The time at which the funds can be withdrawn using unix timestamp.
   uint256 public immutable i_unlockTime; 

   // Using a reentrancy guard to prevent reentrancy attacks on the withdrawal function
   bool private locked;


      // Event for tracking both deposits and withdrawals
    event Withdraw(uint256 amount, uint256 timestamp);
    event Deposit(address indexed sender, uint256 amount);

        /* Errors */
    error Not__Authorized();
    error Not__Unlocked();
    error Transfer___Failed();
    error Insuficient__Funds();
    error Reentrancy__Guard();
    error invalid__LockTime();


        /* Modifier*/
    modifier onlyOwner() {
        if(msg.sender != i_owner){
            revert Not__Authorized();
        }
        _;
    } 

    modifier nonReentrant() {
        // checks
        if(locked){
            revert Reentrancy__Guard();
        }

        // Effects
        locked = true;

        // Interactions
        _;

        // Effects (Unlock the contract after the function executes)
        locked = false;
    }


        /* Functions */

    constructor (uint256 _secondsToLock) {
        if(_secondsToLock == 0){
            revert invalid__LockTime();
        }
        i_owner = msg.sender;
        
        // Locking the funds for a specific duration from now
        i_unlockTime = block.timestamp + _secondsToLock;
    }

    /// @notice receivce() function , Accept Ether directly only. Allow ETH to be sent into the contract.
    receive() external payable { 
           emit Deposit(msg.sender, msg.value);
    }

    /// @notice getBalance() Function, to check contract balance
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }


    /// @notice withdrawal function,
    function withdraw() public  onlyOwner nonReentrant{
            // CHECKS
        // Checks if time lock for the funds has expired
        if(block.timestamp < i_unlockTime){
            revert Not__Unlocked();
        }
        
        uint256 amount = address(this).balance;
        
          // Checks if there is balance to avoid empty calls
        if (amount == 0){
            revert Insuficient__Funds();
        }


            // INTERACTION
        // Transfering the funds from the contract to the owner.
        (bool success, ) = payable(i_owner).call{value: amount}(""); 
        if (!success) {
            revert Transfer___Failed();
        }

         emit Withdraw(amount, block.timestamp);
    }


}







