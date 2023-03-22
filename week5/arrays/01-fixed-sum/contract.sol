// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {

    function sum(uint[5] calldata myArray) pure external returns (uint) {
        uint _sum = myArray[0] + myArray[1] + myArray[2] + myArray[3] + myArray[4];
        return _sum;
    }

    function sum2(uint[5] calldata myArray2) pure external returns (uint total) {
        for(uint i=0; i<myArray2.length; i++) {
            total += myArray2[i];
        }    
    }
    
}