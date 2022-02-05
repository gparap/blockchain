# Copyright (c) 2022 gparap
import Blockchain

if __name__ == '__main__':
    # create blockchain
    blockchain = Blockchain.Blockchain()

    # create some test blocks
    blockchain.create_block(data='block 1', nonce='', prev_hash='TODO', self_hash='TODO', proof_of_work=True)
    blockchain.create_block(data='block 2', nonce='', prev_hash='TODO', self_hash='TODO', proof_of_work=True)
    blockchain.create_block(data='block 3', nonce='', prev_hash='TODO', self_hash='TODO', proof_of_work=True)
    blockchain.create_block(data='block 4', nonce='', prev_hash='TODO', self_hash='TODO', proof_of_work=True)
    blockchain.create_block(data='block 5', nonce='', prev_hash='TODO', self_hash='TODO', proof_of_work=True)
