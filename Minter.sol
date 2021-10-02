// SPDX-License-Identifier: MIT copyright © 2021 gparap
pragma solidity ^0.8.7;

/** 
 * @title Minter
 * @dev An owener that can mint tokens to adresses
 */
 contract Minter{
     address owner;
     mapping(address => uint) tokenReceivers;
     
     constructor(){
         owner = msg.sender;
     }
     
     //mint token to address by the owner only
     function mintTokens(uint tokenAmount, address tokenReceiver) public {
         if (msg.sender == owner) {
             tokenReceivers[tokenReceiver] += tokenAmount;
         }else{
             assert(false);
         }
     }
     
     //return token amounts by address
     function getTokens() public view returns(uint) {
         return tokenReceivers[msg.sender];
     }
 }