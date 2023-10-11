// SPDX-License-Identifier: MIT copyright © 2021 gparap
pragma solidity ^0.8.7;

/** 
 * @title Buyer
 * @dev A buyer pays for stuff & it is send to their wallet
 */
contract Buyer{
    address buyer;
    uint public amountTotal;
    uint constant pricePerAmount = 1 ether;
    mapping (address => uint) public purchasedAmounts;  //map buyers' addresses to amount of stuff purchased
    
    constructor() {
        amountTotal = 10;
        buyer = msg.sender;
    }
    
    function buyStuff(uint requestedAmount) public payable {
        //validate requested amount
        if (!(requestedAmount <= amountTotal && requestedAmount * pricePerAmount == msg.value)){
            assert(false);
        }
        
        //buyer purchases requested amount
        purchasedAmounts[msg.sender] += requestedAmount;
        amountTotal -= requestedAmount;
    }
}