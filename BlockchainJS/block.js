const SHA256 = require('crypto-js/sha256');

/*This is a block of a blockchain*/
class Block {
    constructor(timestamp, data, previousHash = '') {
        this.timestamp = timestamp;         //the time block was created
        this.data = data;                   //block specific transactions data
        this.previousHash = previousHash;   //the hash of the previous block
        this.hash = this.getCurrentHash();  //the hash of the current block
        this.nonce = 0;                     //a non-important part of the block that can be changed
    }

    //returns the hash of the current block
    getCurrentHash() {
        return SHA256(this.timestamp + JSON.stringify(this.data) + this.previousHash + JSON.stringify(this.nonce));
    }
}

module.exports = Block