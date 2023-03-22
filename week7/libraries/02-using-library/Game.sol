// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./UIntFunctions.sol";

contract Game {
    
    uint public participants;
    bool public allowTeams;

    constructor(uint _participants) {
        if(UIntFunctions.isEven(_participants)) {
            allowTeams = true;
        }
        participants = _participants;
    }
}
