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

    //Trackers
    uint16 idTracker;   //tokeep track of the id
    uint todosTracker;  //to keep track of the todos count
    uint[] todoIds;     //to keep track of the total ids

    //Events
    event NewToDoEvent(uint,string,string,uint,bool);   //new todo created
    event DeletedToDoEvent(uint _id);                   //todo deleted
    event CompletedToDoEvent(uint _id);                 //todo completed

    constructor() {
        idTracker = 9999;
        todosTracker = 0;
    }

    //create a new todo
    function createToDo(string memory _name, string memory _details) public {
        //create the new todo
        ToDo memory todo = ToDo(idTracker, _name, _details, block.timestamp, false);

        //add todo to list
        todos[idTracker] = todo;

        //add id to ids list
        todoIds.push(idTracker);

        //emit new todo event
        emit NewToDoEvent(idTracker, _name, _details, block.timestamp, false);

        //update trackers
        idTracker -= 1;
        todosTracker += 1;
    }


    //delete an existing todo
    function deleteToDo(uint _id) public {
        if (!doesToDoExist(_id)) {
            revert();
        }

        //delete todo
        delete todos[_id];

        //remove id from ids list
        for (uint i=0; i<todoIds.length; i++){
            if (todoIds[i] == _id){
                delete todoIds[i];
                break;
            }
        }

        //emit deleted todo event
        emit DeletedToDoEvent(_id);

        //update todo tracker
        todosTracker -= 1;
    }

    //get a specific todo
    function getToDo(uint _id) public view returns(ToDo memory) {
        if (!doesToDoExist(_id)) {
            revert();
        }
        return todos[_id];
    }

    //get the number of todos
    function getToDosCount() public view returns(uint) {
        return todosTracker;
    }

    //mark todo as completed or not and emit the event
    function setCompleted(uint _id, bool _isCompleted) public {
        if (!doesToDoExist(_id)) {
            revert();
        }
        todos[_id].isCompleted = _isCompleted;
        emit CompletedToDoEvent(_id);
    }

    //check if todo exists and returns a boolean
    function doesToDoExist(uint _id) private view returns (bool){
        if (todos[_id].id == 0) {
            return false;
        }
        return true;
    }

    //get a list of all the ids (0 id equals to deleted todo)
    function getToDoIds() public view returns (uint[] memory){
        return todoIds;
    }
}
