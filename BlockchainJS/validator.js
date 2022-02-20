/*Validates the integrity of a blockchain*/
class Validator {

    validateBlockchain(blockchain) {
        //loop through the blocks of the chain (bypass the genesis one)
        for (var i = 1; i < blockchain.chain.length - 1; i++) {
            //validate the current hash
            if (!(compareWordArrays(blockchain.chain[i].getCurrentHash().words, blockchain.chain[i].hash.words))) {
                console.log("Blockchain is NOT valid.");
                return;
            };
            //validate the current/previous hash relation
            if (!(compareWordArrays(blockchain.chain[i].getCurrentHash().words, blockchain.chain[i + 1].previousHash.words))) {
                console.log("Blockchain is NOT valid.");
                return;
            };
        }
        console.log("Blockchain is valid.");
    }
}

module.exports = Validator

//core.js (CryptoJS lib) is giving the hashes in word arrays,
//so they must be checked word by word for equality.
compareWordArrays = function (array1, array2) {
    if (array1.length !== array2.length) {
        return false;
    }
    length = array1.length;
    for (var i = 0; i < length; i++) {
        if (array1[i] !== array2[i]) {
            return false;
        }
    }
    return true;
}
