//imports
const Block = require('./block');
const Blockchain = require('./blockchain');
const Validator = require('./validator');
const Miner = require('./miner');
const Transaction = require('./transaction');

//create the blockchain
let blockchain = new Blockchain();

//create the miner
let miner = new Miner();

//create a bunch of blockchain transactions
blockchain.transactions = [
    new Transaction(100, "address0001", "address9990"),
    new Transaction(150, "address0002", "address8880"),
    new Transaction(200, "address0003", "address7770"),
    new Transaction(150, "address0002", "address8880"),
    new Transaction(100, "address0001", "address9990"),
];

//mine a new block
blockchain.addNewBlock(miner.mineBlock(new Block(Date.now(), blockchain.transactions, blockchain.getLatestAddedBlock().hash)));
blockchain.rewardMiner(miner.address)

//create another bunch of blockchain transactions
blockchain.transactions = [
    new Transaction(100, "address0004", "address9990"),
    new Transaction(200, "address0004", "address8880"),
    new Transaction(150, "address0005", "address8880"),
];

//mine a new block
blockchain.addNewBlock(miner.mineBlock(new Block(Date.now(), blockchain.transactions, blockchain.getLatestAddedBlock().hash)));
blockchain.rewardMiner(miner.address)

//logger
console.log(JSON.stringify(blockchain, null, 4));

//validate the integrity of the blockchain
let validator = new Validator();
validator.validateBlockchain(blockchain);

//get the balance of all addresses:
console.log("balance of address0001: " + blockchain.getAddressBalance("address0001"));
console.log("balance of address0002: " + blockchain.getAddressBalance("address0002"));
console.log("balance of address0003: " + blockchain.getAddressBalance("address0003"));
console.log("balance of address0004: " + blockchain.getAddressBalance("address0004"));
console.log("balance of address0005: " + blockchain.getAddressBalance("address0005"));
console.log("balance of address9990: " + blockchain.getAddressBalance("address9990"));
console.log("balance of address8880: " + blockchain.getAddressBalance("address8880"));
console.log("balance of address7770: " + blockchain.getAddressBalance("address7770"));