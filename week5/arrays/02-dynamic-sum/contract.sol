// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {

    function sum(uint[] calldata myArray) external pure returns (uint total) {
        for(uint i=0; i<myArray.length; i++) {
            total += myArray[i];
        }
    }
    
}