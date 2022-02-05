# Copyright (c) 2022 gparap
import Blockchain
import datetime

if __name__ == '__main__':
    # create blockchain
    Blockchain.Blockchain().create_block(datetime.datetime, 'genesis', '', '0', '0', True)
