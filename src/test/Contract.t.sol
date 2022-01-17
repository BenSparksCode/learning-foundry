// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import 'ds-test/test.sol';

contract ContractTest is DSTest {
	uint256 a;

	function setUp() public {
		a = 10;
	}

	// To test a successful case - prefix test
	function testExample() public {
		assertEq(a, 10);
	}

	// To test a failure case - prefix testFail
	function testFailExample() public {
		assertEq(a, 9);
	}
}
