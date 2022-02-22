// SPDX-License-Identifier: MIT
// Copyright © 2022 gparap
pragma solidity >=0.4.17; 

contract SmartContractTemplate {
    string private name;
    address private owner;
    uint private balance;

    constructor() {
        name = "Smart Contract Template";
        owner = msg.sender;

        //set initial balance
        if (owner != address(0x0)){
            balance = owner.balance;
        }     
    }

    function getContractName() public view returns(string memory) {
        return name;
    }

    function setContractName(string memory _name) public {
        name = _name;
    }

    function getInitialBalance() public view returns (uint) {
        return balance;
    }

    function getAddressBalance(address _address) public view returns (uint) {
        return _address.balance;
    }
}