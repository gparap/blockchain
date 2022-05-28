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
    uint256 gamblesCount;
    address payable private owner;
    address payable[] public gamblers;

    constructor() {
        //initialize
        pool = 0;
        gamblesCount = 0;
        owner = payable(msg.sender);
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

    function performTheLottery() private view returns(uint256) {
        //randomize
        uint256 random = uint256(keccak256("gparap"));
        uint256 winnerIndex = random % gamblesCount;

        //return the index of the person who won the lottery
        return winnerIndex;
    }

    function payTheWinner() isOwner public {
        uint256 winnerIndex = performTheLottery();
        address payable winningAddress;
        uint256 i;

        //loop through the gamblers to find and pay the winner
        for (i = 0; i < gamblesCount; i++) {
            if (i == winnerIndex) {
                winningAddress = gamblers[i];
                winningAddress.transfer(address(this).balance);
            }
        }
    }
}