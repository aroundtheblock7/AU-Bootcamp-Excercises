// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function makeContact(address hero) external {
     (bool s, ) = hero.call("0x1314adf8");
        require(s);
    }
}