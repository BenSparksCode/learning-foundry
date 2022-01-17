// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

contract Contract {
	function addOne(uint256 x) external returns (uint256) {
		return ++x;
	}
}
