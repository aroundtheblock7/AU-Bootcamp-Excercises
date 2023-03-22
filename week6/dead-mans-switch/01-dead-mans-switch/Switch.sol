// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Switch {

    address public owner;
    address public recipient;
    uint public timePinged;

    constructor(address _recipient) payable {
        recipient = _recipient;
        owner = msg.sender;
        timePinged = block.timestamp;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function withdraw() public payable {
        require((block.timestamp - timePinged) >= 52 weeks);
        (bool success,) = recipient.call{value: address(this).balance}("");
        require(success, "Transfer Failed");
    }

    function ping() public onlyOwner {
        timePinged = block.timestamp;
    }

}