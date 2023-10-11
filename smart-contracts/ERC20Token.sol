// SPDX-License-Identifier: MIT copyright © 2021 gparap
pragma solidity ^0.8.7;

/**
 * @title ERC20_Token
 * @dev A token template of the ERC-20 Token Standard.
 */
contract ERC20_Token {
    string tokenName = "ERC-20 Token Name";
    string tokenSymbol = "ERC";
    uint8 tokenDecimals = 8;
    uint256 tokenSupply = 100000000;
    mapping(address => uint256) tokenBalance;
    mapping(address => mapping(address => uint)) tokenAllowance;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    //returns the name of the token
    function name() public view returns (string memory) {
        return tokenName;
    }
    
    //returns the symbol of the token
    function symbol() public view returns (string memory) {
        return tokenSymbol;
    }
    
    //returns the number of decimals the token uses
    function decimals() public view returns (uint8) {
        return tokenDecimals;
    }
    
    //returns the total token supply
    function totalSupply() public view returns (uint256) {
        return tokenSupply;
    }
    
    //returns the account balance of another account with address _owner
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return tokenBalance[_owner];
    }
    
    //transfers _value amount of tokens to address _to
    function transfer(address _to, uint256 _value) public returns (bool success) {
        //the message caller’s account balance must have enough tokens to spend
        assert(tokenBalance[msg.sender] > _value);

        //fire the Transfer event
        emit Transfer(msg.sender, _to, _value);
        
        //handle token balance
        tokenBalance[msg.sender] -= _value;
        tokenBalance[_to] += _value;
        
        //token transaction is successful
        return true;
    }
    
    //transfers _value amount of tokens from address _from to address _to
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //the message caller’s account balance must have enough tokens to spend
        assert(tokenBalance[_from] > _value);
        
        //the message caller’s account balance must have enough allowance tokens to spend
        assert(tokenAllowance[_from][msg.sender] > _value);
        
        //fire the Transfer event
        emit Transfer(msg.sender, _to, _value);
        
        //handle token balance
        tokenBalance[_from] -= _value;
        tokenBalance[_to] += _value;
        
        //handle token allowance
        tokenAllowance[_from][msg.sender] -= _value;
        
        //token transaction is successful
        return true;
    }

    //allows _spender to withdraw _value amount of tokens on behalf of the msg.sender
    function approve(address _spender, uint256 _value) public returns (bool success) {
        tokenAllowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    
        //token approval is successful
        return true;
    }
    
    //returns the amount that _spender is allowed to withdraw from _owner
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return tokenAllowance[_owner][_spender];
    }
}