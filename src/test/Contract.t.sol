// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import 'ds-test/test.sol';
import '../Contract.sol';

contract ContractTest is DSTest {
	Contract myContract;

	function setUp() public {
		myContract = new Contract();
	}

	// run forge test -vvvv for details including logs
	function testAddOne() public {
		emit log_string('hey');
		assertEq(3, myContract.addOne(2));
	}

	// testing fuzzing in Foundry
	function testAddOneFuzz(uint256 x) public {
		assertEq(x + 1, myContract.addOne(x));
	}

	// prefix test with testFail to check failure cases
	function testFailAddOne() public {
		assertEq(2, myContract.addOne(2));
	}
}
