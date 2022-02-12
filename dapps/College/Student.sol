// SPDX-License-Identifier: MIT copyright © 2022 gparap

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Student
 * @dev A student ledger for a college
 */
contract Student {

    string name;
    uint age;
    string[] lessons;
    uint semester;

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

    function getLessons() public view returns(string[] memory){
        return lessons;
    }

    function addLesson(string memory _lesson) public {
        lessons.push(_lesson);
    }

    function getSemester() public view returns(uint){
        return semester;
    }

    function setSemester(uint _semester) public {
        semester = _semester;
    }

    // Get all variables of a student
    function getStudent() public view returns(string memory, uint, string[] memory, uint){
        return (name, age, lessons, semester);
    }

    // Set all variables of a student
    function setStudent(string memory _name, uint _age, string[] memory _lessons, uint _semester) public{
        name = _name; age = _age; lessons = _lessons; semester = _semester;
    }
}