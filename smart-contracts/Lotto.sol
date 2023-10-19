// SPDX-License-Identifier: MIT
// Copyright © 2023 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Lotto Contract
 * @dev Accepts ether from multiple users and picks a lucky one at random to win the lottery
 */
contract Lotto {
    uint256 pool;
    mapping(address => uint256) public gambles;
    uint256 gamblesCount;
    address payable private owner;
    address payable[] public gamblers;
    uint256 profitPercentage;

    constructor() {
        //initialize
        pool = 0;
        gamblesCount = 0;
        owner = payable(msg.sender);
        profitPercentage = 10;
    }

    modifier isOwner() {
        //check if the caller is the owner
        require(msg.sender == owner, "This caller is not the contract owner...");
        _;
    }

    //get contract owner
    function getOwner() public view returns(address) {
        return owner;
    }

    //add ether to the lottery pool
    function gambleAmount() public payable {
        //minimum amount of ether required
        require(msg.value > 1 ether);

        //add person address & amount to lists
        gamblers.push(payable(msg.sender));
        gambles[msg.sender] += msg.value;
        gamblesCount += 1;

        //add ether to pool
        pool += msg.value;
    }

    //get the total amount of ether in the pool
    function getPoolAmount() public view returns(uint256) {
        return pool;
    }

    //display the amount gamled by the person
    function getPersonGambleAmount() public view returns(uint256) {
        return gambles[msg.sender];
    }

    //returns the index of the winning address at random
    function getWinnerIndex() private view returns(uint256) {
        //randomize
        uint256 random = uint256(keccak256("gparap"));
        uint256 winnerIndex = random % gamblesCount;

        //return the index of the person who won the lottery
        return winnerIndex;
    }

    //transfer pool amount (minus owner profit) to the winner
    function payTheWinner() isOwner public {
        uint256 winnerIndex = getWinnerIndex();
        address payable winningAddress;
        uint256 i;

        //loop through the gamblers to find and pay the winner
        for (i = 0; i < gamblesCount; i++) {
            if (i == winnerIndex) {
                winningAddress = gamblers[i];
                giveProfitToOwner();
                winningAddress.transfer(pool);
            }
        }
    }

    //contract owner receives a profit percentage from the lottery pool
    function giveProfitToOwner() isOwner private {
        require (profitPercentage > 0);

        //give owner profit from pool
        uint256 profit = pool * profitPercentage / 100;
        pool = pool - profit;
        owner.transfer(profit);
        
        //!!! important so as the owner cannot profit more
        profitPercentage = 0;
    }
}
