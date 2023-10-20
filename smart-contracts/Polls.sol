// SPDX-License-Identifier: MIT
// Copyright © 2023 gparap
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Polls Contract
 * @dev Registers candidates, accepts votes and shows the results
 */
contract Polls {
    address owner;
    address [5] candidateAddresses;
    string [5] candidateNames;
    uint [5] candidateVotes;
    uint private maxCandidates;
    address [] voters;

    constructor() {
        owner = msg.sender;
        maxCandidates = 5;
    }

    modifier isOwner() {
        require (msg.sender == owner, "Not the contract owner...");
        _;
    }

    //candidates can be registered once and only from the owner
    function registerCandidate(address _address, string memory _name) isOwner public payable {
        bool isEligible = true;

        //check if it is not the owner
        if (_address == owner) {
            isEligible = false;
        }

        //check if candidate is already registered
        for (uint i=0; i<maxCandidates; i++) {
            require(candidateAddresses[i] != _address, "Candidate already registered...");
            if (candidateAddresses[i] == _address) {
                isEligible = false;
                break;
            }
        }

        //register candidate
        if (isEligible == true && candidateAddresses.length <= maxCandidates) {
            for (uint i=0; i<maxCandidates; i++) {
                if (isEligible == true && candidateAddresses[i] == 0x0000000000000000000000000000000000000000) {
                    isEligible = false;

                    //update candidate tables
                    candidateAddresses[i] = _address;
                    candidateNames[i] = _name;
                    candidateVotes[i] = 0;
                }
            }
        }
    }

    //gets candidate address at position
    function getCandidateAddress(uint position) isOwner public view returns(address _address) {
        if (position < maxCandidates) {
            return candidateAddresses[position];
        }
    }

    //gets candidate name at position
    function getCandidateName(uint position) isOwner public view returns(string memory _name) {
        if (position < maxCandidates) {
            return candidateNames[position];
        }
    }

    //gets candidate vote at position
    function getCandidateVotes(uint position) isOwner public view returns(uint _votes) {
        if (position < maxCandidates) {
            return candidateVotes[position];
        }
    }

    //vote for candidate
    function voteByPosition(uint position, address _address) isOwner public payable {
        bool isEligible = true;

        //check if it is not the candidate itself
        address _candidateAddress = getCandidateAddress(position);
        if (_address == _candidateAddress) {
            isEligible = false;
        }

        //check if the current voter has not voted before
        for (uint i=0; i<voters.length; i++) {
            if (voters[i] == _address) {
                isEligible = false;
                break ;
            }
        }

        if (position < maxCandidates && isEligible) {
            candidateVotes[position] += 1;
        }

        //add the recent voter to voters array
        voters.push(_address);
    }
}
