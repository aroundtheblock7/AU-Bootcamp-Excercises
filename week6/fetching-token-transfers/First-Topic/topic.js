const { keccak256 } = require("ethereum-cryptography/keccak");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

function firstTopic() {
    //Add the event signature
    const eventSignature = "Transfer(address,address,uint256)"; 
    const bytes = utf8ToBytes(eventSignature);
    const digest = keccak256(bytes);
    return toHex(digest); 
}

function secondTopic() {
    
}

module.exports = { firstTopic, secondTopic }