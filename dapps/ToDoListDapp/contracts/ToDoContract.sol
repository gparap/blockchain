// SPDX-License-Identifier: MIT
// © 2023 gparap
pragma solidity >=0.4.22 <0.9.0;

/**
 * @title ToDoContract
 * @dev A To-Do List Contract
 */
contract ToDoContract {
    struct ToDo {
        uint id;
        string name;
        string details;
        uint date;
        bool isCompleted;
    }
    mapping (uint => ToDo) private todos;

    //to keep track of the id
    uint idTracker = 9999; //TODO: fix tracker to start from 0
    function getCurrentId() public view returns(uint) {
        return idTracker;
    }

    //to keep track of the todos count
    uint todosTracker = 0;

    //Events
    event NewToDoEvent(uint,string,string,uint,bool);   //new to-do created
    event DeletedToDoEvent(uint _id);                   //to-do deleted
    event CompletedToDoEvent(uint _id);                 //to-do completed

    constructor() {
    }

    //create a new todo
    function createToDo(string memory _name, string memory _details) public {
        //create the new todo
        ToDo memory todo = ToDo(idTracker, _name, _details, block.timestamp, false);

        //add todo to list
        todos[idTracker] = todo;

        //update trackers
        idTracker -= 1;
        todosTracker += 1;
    }

    //delete an existing todo
    function deleteToDo(uint _id) public {
        //delete todo
        delete todos[_id];

        //update todo tracker
        todosTracker -= 1;
    }

    //get a specific todo
    function getToDo(uint _id) public view returns(ToDo memory) {
        return todos[_id];
    }

    //get the number of todos
    function getToDosCount() public view returns(uint) {
        return todosTracker;
    }

    //mark todo as completed or not
    function setCompleted(uint _id, bool _isCompleted) public {
        todos[_id].isCompleted = _isCompleted;
    }
}
