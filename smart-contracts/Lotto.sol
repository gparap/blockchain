// SPDX-License-Identifier: MIT
// Copyright © 2022 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Lotto Contract
 * @dev Accepts ether from multiple users and picks a lucky one at random to win the lottery
 */
contract Lotto {
    uint256 pool;
    mapping(address => uint256) public gambles;
    mapping(address => uint256) public prizes;
    uint256 gamblesCount;

    constructor() {
        //initialize
        pool = 0;
        gamblesCount = 0;
    }

    //add ether to the lottery pool
    function gambleAmount(uint256 amount) public {
        //add person amount to list
        gambles[msg.sender] += amount;
        gamblesCount += 1;
        prizes[msg.sender] = 0;

        //add ether to pool
        pool += amount;
    }

    //get the total amount of ether in the pool
    function getPoolAmount() public view returns(uint256) {
        return pool;
    }

    //display the amount gamled by the person
    function getPersonGambleAmount() public view returns(uint256) {
        return gambles[msg.sender];
    }

    //display the amount that the person has won in the lottery
    function getPersonPrizeAmount() public view returns(uint256) {
        return prizes[msg.sender];
    }

    function performTheLottery() public view returns(uint256) {
        //randomize
        uint256 random = uint256(keccak256("gparap"));
        uint256 winnerIndex = random % gamblesCount;

        //return the index of the person who won the lottery
        return winnerIndex;
  }
}