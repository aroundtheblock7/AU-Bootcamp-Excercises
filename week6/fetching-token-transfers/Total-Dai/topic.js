const { keccak256 } = require("ethereum-cryptography/keccak");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

function firstTopic() {
    const eventSignature = "Transfer(address,address,uint256)"; 
    const bytes = utf8ToBytes(eventSignature);
    const digest = keccak256(bytes);
    return toHex(digest); 
}

//We're going to specify the _from address in the Transfer event.... 
//... this way, we can filter on who sent the token.
//0x28c6c06298d514db089934071355e5743bf21d60
//Paste the above address into a string in the secondTopic function.
//Strip the leading 0x out of the address.
//Pad this address out to 32 bytes by adding zeroes in front of the address.
//Remember that an address is 20 bytes, which is 40 hexadecimal characters....
//...we'll want to pad this out with zeroes until it is 32 bytes, which is 64 hexadecimal characters.

function secondTopic() {
    const address = "28c6c06298d514db089934071355e5743bf21d60";
    return "0".repeat(24) + address;
}
module.exports = { firstTopic, secondTopic }