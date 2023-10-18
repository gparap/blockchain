// SPDX-License-Identifier: MIT copyright © 2023 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Soda Machine
 * @dev An automatic machine that sells sodas
 */
contract SodaMachine {
    address public owner;
    mapping(address => uint256) public items;
    uint maxBalance = 300;
    uint refillBalance = 30;
    uint itemCost = 3 ether;

    constructor() {
        owner = msg.sender;
        setBalance(maxBalance);
    }

    // Set the initial amount of items in the machine
    function setBalance(uint256 _balance) private {
        items[owner] = _balance;
    }

    // Get the number of items in the machine
    function getBalance() public view returns(uint) {
        return items[owner];
    }

    // Buy an item from the machine
    function buyItems(uint _items) public payable {       
        // check if there is the demanded quantity of items in the machine
        // and the buyer has the ether to afford the items' cost
        if (items[owner] >= _items && msg.value >= getItemsCost(_items)) {
            // give the buyer the demanded quantity of items
            items[msg.sender] += _items;

            // remove the bought quantity from the machine
            items[owner] -= _items;

        }
    }

    // The owner checks if the machine needs a refill
    function refill() public payable {
        // check if the caller is the owner
        require (msg.sender == owner, "Function caller is not the contract owner");
            
        // refill the machine if needed
        if (items[msg.sender] <= refillBalance) {
            setBalance(maxBalance);
        }
    }

    // Calculate the cost of a number of items (in ether)
    function getItemsCost(uint _items) public view returns(uint) {
        return _items * itemCost;
    }
}
