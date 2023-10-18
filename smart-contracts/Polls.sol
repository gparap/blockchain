// SPDX-License-Identifier: MIT
// Copyright © 2023 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Polls Contract
 * @dev Registers candidates, accepts votes and shows the results
 */
contract Polls {
    address owner;
    address [5] candidates;
    uint private maxCandidates;  

    constructor() {
        owner = msg.sender;
        maxCandidates = 5;
    }

    modifier isOwner() {
        require (msg.sender == owner, "Not the contract owner...");
        _;
    }

    //candidates can be registered once and only from the owner
    function registerCandidateAddress(address _address) isOwner public payable {
        bool isEligible = true;

        //check if it is not the owner
        if (_address == owner) {
            isEligible = false;
        }

        //check if candidate is already registered
        for (uint i=0; i<maxCandidates; i++) {
            require(candidates[i] != _address, "Candidate already registered...");
            if (candidates[i] == _address) {
                isEligible = false;
                break;
            }
        }

        //register candidate
        if (isEligible == true && candidates.length <= maxCandidates) {
            for (uint i=0; i<maxCandidates; i++) {
                if (isEligible == true && candidates[i] == 0x0000000000000000000000000000000000000000) {
                    isEligible = false;
                    candidates[i] = _address;
                }
            }
        }
    }

    //gets candidate address at position
    function getCandidateAddress(uint position) isOwner public view returns(address _address) {
        if (position < maxCandidates) {
            return candidates[position];
        }
    }
}
