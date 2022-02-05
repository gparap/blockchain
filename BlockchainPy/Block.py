# A block in the blockchain
# Copyright (c) 2022 gparap
import hashlib


class Block:
    def __init__(self, index, timestamp, data, nonce, prev_hash, proof_of_work):
        self.index = index
        self.timestamp = timestamp
        self.data = data
        self.nonce = nonce
        self.prev_hash = prev_hash
        self.hash = self.generate_hash_256(timestamp, data, nonce, prev_hash)
        self.proof_of_work = proof_of_work

    def get_hash(self):
        return self.hash

    @staticmethod
    def generate_hash_256(timestamp, data, nonce, prev_hash):
        """
        Generates a secure hash algorithm with internal block size of 32 bits
        :param timestamp:   timestamp block created
        :param data:        block's data
        :param nonce:       block's nonce
        :param prev_hash:   previous block's hash
        :return: sha256
        """
        encoded_string_for_hash = str.encode(timestamp + data + nonce + prev_hash)
        _hash = hashlib.sha256(encoded_string_for_hash).hexdigest()
        return _hash
