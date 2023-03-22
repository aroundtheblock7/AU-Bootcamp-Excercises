// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {

    address public owner;
    uint price;
    
    event Deployed (address indexed);
    event Transfer (address indexed _originalowner, address indexed _newowner);
    event ForSale (uint _price, uint _blocktimestamp);
    event Purchase (uint _amount, address indexed _buyer);

    constructor() {
        owner = msg.sender;
        emit Deployed(owner);
    }

    function transfer (address _recepient) public {
        require(msg.sender == owner);
        owner = _recepient; 
        emit Transfer(msg.sender, _recepient);
    }

    function markPrice(uint _askingPrice) external {
        require(msg.sender == owner);
        price = _askingPrice;
        emit ForSale(_askingPrice, block.timestamp);
    }

    function purchase() external payable {
        require(msg.value == price);
        require(price > 0);
        price = 0;
        (bool success, ) = owner.call{ value: msg. value }("");
        require(success);
        owner = msg.sender;
        emit Purchase(msg.value, msg.sender);
    } 
}