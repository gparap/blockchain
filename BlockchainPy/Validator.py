# Ensures the validity of blocks inside a blockchain
# Copyright (c) 2022 gparap
from Blockchain import Blockchain


class Validator:
    def __init__(self, blockchain: Blockchain):
        self.blockchain = blockchain

    # the previous hash of the current block must match the hash of the previous block
    def validate_blockchain(self):
        i = 0
        for block in self.blockchain.get_all_blocks():
            # skip genesis block
            if i == 0:
                i += 1
                continue

            # get the previous block hash
            prev_block = self.blockchain.get_block_at(i - 1)
            prev_block_hash = prev_block.get_hash()

            # check if the block's previous hash matches the hash of the previous block
            if block.prev_hash != prev_block_hash:
                print("blockchain is invalid...")
                return

            i += 1
        print("blockchain is valid...")
        pass
