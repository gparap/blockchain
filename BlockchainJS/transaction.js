/*This is a blockchain transaction blueprint*/
class Transaction {
    constructor(tokens, fromAddress, toAddress){
        this.tokens = tokens;
        this.fromAddress = fromAddress;
        this.toAddress = toAddress;
    }
}

module.exports = Transaction