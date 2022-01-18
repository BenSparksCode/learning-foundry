// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import 'ds-test/test.sol';
import '../Contract.sol';

import 'solmate/tokens/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract Foo {
	function bar() external {
		require(msg.sender == address(1), 'wrong caller');
	}
}

interface Vm {
	function prank(address) external;

	function expectRevert(bytes calldata) external;
}

contract ContractTest is DSTest {
	// address(bytes20(uint160(uint256(keccak256('hevm cheat code')))))
	// = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D
	Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
	Contract myContract;
	Foo foo;

	function setUp() public {
		myContract = new Contract();
		foo = new Foo();
	}

	function testBarWorks() public {
		vm.prank(address(1)); //use prank to set msg.sender to address(1)
		foo.bar();
	}

	function testBarReverts() public {
		vm.expectRevert('wrong caller'); //use expectRevert to expect a revert
		foo.bar();
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
