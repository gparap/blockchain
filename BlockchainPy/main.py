# Copyright (c) 2022 gparap
from Blockchain import Blockchain
from Validator import Validator
from Miner import Miner

if __name__ == '__main__':
    # create blockchain
    blockchain = Blockchain()

    # create the miner
    miner = Miner(blockchain.pow_solution)

    # mine some test blocks
    blockchain.create_block(data='block 1', nonce='', prev_hash=blockchain.get_block_at(0).get_hash(),
                            proof_of_work=miner.mineBlock())
    blockchain.create_block(data='block 2', nonce='', prev_hash=blockchain.get_block_at(1).get_hash(),
                            proof_of_work=miner.mineBlock())
    blockchain.create_block(data='block 3', nonce='', prev_hash=blockchain.get_block_at(2).get_hash(),
                            proof_of_work=miner.mineBlock())
    blockchain.create_block(data='block 4', nonce='', prev_hash=blockchain.get_block_at(3).get_hash(),
                            proof_of_work=miner.mineBlock())
    blockchain.create_block(data='block 5', nonce='', prev_hash=blockchain.get_block_at(4).get_hash(),
                            proof_of_work=miner.mineBlock())

    # validate the blockchain
    validator = Validator(blockchain)
    validator.validate_blockchain()
