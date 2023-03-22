// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {

    mapping(address => bool) attendeePaid;

    address[] public rsvpAddress;

    uint public deposit;

    //uint public totalDeposit;

    //uint public refund;

    constructor(uint _deposit) payable {
        deposit = _deposit;
    }
	
    function rsvp() external payable {
        require(msg.value == deposit, "You must deposit the min amount or more");
        require(!attendeePaid[msg.sender]);
        rsvpAddress.push(msg.sender);
        attendeePaid[msg.sender] = true;
    }

    function payBill(address venue, uint amount) external payable {
        (bool success, ) = venue.call{value: amount}("");
        require (success, "Transfer failed");
        uint refund = address(this).balance / rsvpAddress.length;
        for(uint i=0; i<rsvpAddress.length; i++) {
            (bool sent, ) = rsvpAddress[i].call{value: refund}("");
            require(sent, "Transfer Failed");  
        }
    }
}