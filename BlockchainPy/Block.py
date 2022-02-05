# A block in the blockchain
# Copyright (c) 2022 gparap

class Block:
    def __init__(self, index, timestamp, data, nonce, prev_hash, self_hash, proof_of_work):
        self.index = index
        self.timestamp = timestamp
        self.data = data
        self.nonce = nonce
        self.prev_hash = prev_hash
        self.self_hash = self_hash
        self.proof_of_work = proof_of_work
