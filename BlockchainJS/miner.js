/*This is the proof-of-work miner of new blocks for the blockchain*/
class Miner {
    constructor() {
        //!!! Do NOT use above this level for debug purposes. 
        //!!! I repeat, do NOT!
        this.difficulty = 3;
        this.address = "minerAddress"
    }

    /* Proof of Work: Mines a new block based on a mining difficulty level */
    mineBlock(newBlock) {
        var blockHash = newBlock.hash.toString();
        var requesteSubHash = "";

        //fill in the array with zeros
        for (var i = 0; i < this.difficulty; i++) {
            requesteSubHash += "0";
        }

        //keep mining until you have the requested sub hash value
        while (blockHash.toString().substring(0, this.difficulty) !== requesteSubHash) {
            blockHash = newBlock.getCurrentHash().toString();
            newBlock.nonce = blockHash;
            console.log(blockHash.toString());
        }
        console.log("-----------------------------------------------------------");
        console.log("---------------N-E-W---B-L-O-C-K---M-I-N-E-D---------------");
        console.log("-----------------------------------------------------------");
        return newBlock;
    }
}

module.exports = Miner