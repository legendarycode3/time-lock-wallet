// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {TimeLockWallet} from "../src/TimeLockWallet.sol";


contract TimeLockWalletTest is Test { 

    TimeLockWallet timelockwallet;
    address public DEPOSITOR = makeAddr("depositor");
    uint256 public constant STARTING_DEPOSITORS_AMOUNT = 2 ether;

     function setUp() public {
       // Deploy the TimeLockWallet contract with a lock time of 1 day (86400 seconds)
       uint256 lockTime = 1 days;
        timelockwallet = new TimeLockWallet(lockTime);
    }


    /// @notice Tests if the deposit function works correctly
    function testIfDepositWorks() public {
            // ARRANGE
        // Fund the depositor with some ether to test the deposit function
        vm.deal(DEPOSITOR, STARTING_DEPOSITORS_AMOUNT);

        // Impersonate the depositor to call the deposit function
        vm.prank(DEPOSITOR);

            // ACT
        // Sending ether to the TimeLockWallet contract using the receive function
        (bool success,) = address(timelockwallet).call{value: STARTING_DEPOSITORS_AMOUNT}("");

            // ASSERT
        // Assert that the deposit was succeeded
        assertEq(success, true);
        assertEq(address(timelockwallet).balance, STARTING_DEPOSITORS_AMOUNT);
    }


    /// @notice Function to test if the withdraw function works correctly after the lock
    function testIfOnlyOwnerCanWithdraw() public {
            // ARRANGE: 
        //Expect a revert (no specific error check here)
        vm.expectRevert();

            // ACT
        // Impersonate a non-owner (DEPOSITOR)
        vm.prank(DEPOSITOR);

            // ASSERT
        // Call the function
        timelockwallet.withdraw();
    }

}