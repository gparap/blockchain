# A blockchain
# Copyright (c) 2022 gparap
import datetime
import Block


class Blockchain:
    def __init__(self):
        self.chain = []
        self.genesis()

    def genesis(self):
        block = Block.Block('0', str(datetime.datetime.now()), 'genesis', '', '0', '0', True)
        self.chain.append(block)
        self.print_feedback("Genesis block created successfully...")
        pass

    def create_block(self, data, nonce, prev_hash, self_hash, proof_of_work):
        # find next position in the chain
        index = len(self.chain)

        # get the genesis timestamp
        timestamp = str(datetime.datetime.now())

        # create a new block and add it to the chain
        block = Block.Block(index, timestamp, data, nonce, prev_hash, self_hash, True)
        self.chain.append(block)
        self.print_feedback("Block at index: " + str(index) + " created successfully...")
        pass

    @staticmethod
    def print_feedback(value):
        print(f'{value}')
