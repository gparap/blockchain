//import and create block
const Block = require('./block');
let block = new Block();

//import transaction
const Transaction = require('./transaction');

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
        this.transactions = []; //pending transaction data
        this.reward = 10;       //reward for the miner in tokens
    }

    //creates the genesis (initial) block of the blockchain
    createGenesisBlock() {
        return new Block("2021-10-16", "block: genesis", 0);
    }

    //returns the latest block that was added to the blockchain
    getLatestAddedBlock() {
        return this.chain[this.chain.length - 1];
    }

    //adds a block to the blockchain
    addNewBlock(newBlock) {
        newBlock.hash = newBlock.getCurrentHash();
        newBlock.previousHash = this.getLatestAddedBlock().hash;
        this.chain.push(newBlock);

        //there are no more transactions as the block is mined
        this.transactions = [];
    }

    //rewards the block miner with tokens
    rewardMiner(minerAddress) {
        this.transactions = [
            new Transaction(this.reward, null, minerAddress)
        ];
    }

    //loop through all the transactions of all the blocks inside the blockchain and
    //returns the number of tokens of the specific address
    getAddressBalance(address) {
        let balance = 0;
        for (const block of this.chain) {
            for (const transaction of block.data) {
                //remove balance if tokens were send to address
                if (transaction.fromAddress === address) {
                    balance -= transaction.tokens;
                }
                //add balance if tokens were received from address
                if (transaction.toAddress === address) {
                    balance += transaction.tokens;
                }
            }
        }
        return balance;
    }
}

module.exports = Blockchain