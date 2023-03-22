// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
	uint[] public evenNumbers;

	function filterEven(uint[] calldata myArray) external {
		for(uint i = 0; i < myArray.length; i++) {
			if(myArray[i] % 2 == 0) {
				evenNumbers.push(myArray[i]);
			}
		}
	}
}