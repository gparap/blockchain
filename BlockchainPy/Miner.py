# The miner searches for the proof-of-work solution that is demanded by the blockchain
# Copyright (c) 2022 gparap
import hashlib


class Miner:
    def __init__(self, pow_solution):
        self.pow_solution = pow_solution

    def mine_block(self):
        solution = 0
        counter = 0

        # mine until you find the proof-of-work solution that is demanded by the blockchain
        while solution != self.pow_solution:
            solution = hashlib.sha256(str(solution).encode()).hexdigest()

            if solution.startswith(self.pow_solution, 0, len(self.pow_solution)):
                print("New block mined successfully...")
                return True
            else:
                counter += 1
                solution = counter
