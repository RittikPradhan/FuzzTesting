//SPDX-License-Identifier: None

pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/TestContract.sol";

contract TCTester is Test {
    TestContract public tc;
    address userAddress = 0x009d7d504B9F51cbcFD690087113779FFF4E3827;

    function setUp() public {
        tc = new TestContract();
        tc.add{value: 100}(userAddress);
    }

    function testAdd() public {
        tc.add{value: 100}(userAddress);
        assertEq(tc.getBalance(userAddress), 100);
    }

    function testWithdraw() public {
        tc.withdraw(userAddress, 0);
        assertEq(tc.getBalance(userAddress), 0);
    }
}