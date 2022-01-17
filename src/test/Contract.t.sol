// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import 'ds-test/test.sol';
import '../Contract.sol';

contract ContractTest is DSTest {
	Contract myContract;

	function setUp() public {
		myContract = new Contract();
	}

	function testAddOne() public {
		assertEq(3, myContract.addOne(2));
	}

	function testFailAddOne() public {
		assertEq(2, myContract.addOne(2));
	}
}
