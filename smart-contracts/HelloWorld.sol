/*Copyright © 2023 gparap*/
pragma solidity ^0.4.0;

contract HelloWorld{
    string value;
    
    //initialize value
    constructor() public {
        value = "hello world!";
    }
    
    //get my value
    function getValue() public view
    returns(string) {
        return value;
    }
    
    //set my value to a new value
    function setValue(string newValue) public {
        value = newValue;
    }
}
