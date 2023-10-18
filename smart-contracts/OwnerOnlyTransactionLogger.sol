// SPDX-License-Identifier: MIT copyright © 2023 gparap
pragma solidity ^0.8.7;

/** 
 * @title Owner_Only_Transaction_Logger
 * @dev Only the owner of the contract can log transaction details.
 */
contract Owner_Only_Transaction_Logger {
    address private owner;
    event LogData(bytes);       //complete calldata
    event LogGas(uint) ;        //remaining gas
    event LogSender(address);   //the sender of the message
    event LogSig(bytes4);       //first four bytes of the calldata
    event LogValue(uint);       //number of wei sent with the message
    
    constructor() {
        owner = msg.sender;
    }
    
    //don't run unless it's the owner of the contract
    modifier isOwner {
        assert(owner == msg.sender);
        _;
    }
    
    fallback() external payable isOwner {
        //log transaction details
        emit LogData(msg.data);
        emit LogGas(gasleft());
        emit LogSender(msg.sender);
        emit LogSig(msg.sig);
        emit LogValue(msg.value);
    }
}
