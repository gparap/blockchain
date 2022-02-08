# A blockchain
# Copyright (c) 2022 gparap
import datetime
import Block


class Blockchain:
    def __init__(self):
        self.__chain = []
        self.genesis()
        self.pow_solution = "000000"  # !!! do not make this bigger than 4-6 for testing purposes

    def genesis(self):
        block = Block.Block('0', str(datetime.datetime.now()), 'genesis', '', '0', True)
        self.__chain.append(block)
        self.print_feedback("Genesis block created successfully...")
        pass

    def create_block(self, data, nonce, prev_hash, proof_of_work):
        # find next position in the chain
        index = len(self.__chain)

        # get the genesis timestamp
        timestamp = str(datetime.datetime.now())

        # create a new block and add it to the chain
        block = Block.Block(index, timestamp, data, nonce, prev_hash, True)
        self.__chain.append(block)
        self.print_feedback("Block at index: " + str(index) + " with hash: " + str(block.hash) + " created "
                                                                                                 "successfully...")
        pass

    def get_all_blocks(self):
        return self.__chain

    def get_block_at(self, index):
        return self.__chain[index]

    @staticmethod
    def print_feedback(value):
        print(f'{value}')
