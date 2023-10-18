// SPDX-License-Identifier: MIT copyright © 2023 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Teacher
 * @dev A teacher ledger for a college
 */
contract Teacher {

    string name;
    uint age;
    string lesson;
    uint salary;

    constructor() {}

    function getName() public view returns(string memory){
        return name;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function getAge() public view returns(uint){
        return age;
    }

    function setAge(uint _age) public {
        age = _age;
    }

    function getLesson() public view returns(string memory){
        return lesson;
    }

    function setLesson(string memory _lesson) public {
        lesson = _lesson;
    }

    function getSalary() public view returns(uint){
        return salary;
    }

    function setSalary(uint _salary) public {
        salary = _salary;
    }

    // Get all variables of a teacher
    function getTeacher() public view returns(string memory, uint, string memory, uint){
        return (name, age, lesson, salary);
    }

    // Set all variables of a teacher
    function setTeacher(string memory _name, uint _age, string memory _lesson, uint _salary) public{
        name = _name; age = _age; lesson = _lesson; salary = _salary;
    }
}
