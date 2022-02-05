# Copyright (c) 2022 gparap
import datetime


class Blockchain:
    def __init__(self):
        self.chain = []
        self.genesis()

    def genesis(self):
        self.create_block(datetime.datetime, 'genesis', '', '0', '0', True)  # create genesis block
        self.print_feedback("Genesis block created successfully...")
        pass

    def create_block(self, timestamp, data, nonce, prev_hash, self_hash, proof_of_work):
        """
        Creates a new block
            :param timestamp:        The timestamp of the block creation
            :param data:             The block's data
            :param nonce:            The block's nonce data
            :param prev_hash:        The hash of the previous block in the chain
            :param self_hash:        The block's hash
            :param proof_of_work:    Confirmation that the block was mined appropriately
        """
        pass

    def print_feedback(self, value):
        print(f'{value}')
