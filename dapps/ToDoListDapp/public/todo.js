// SPDX-License-Identifier: MIT
// © 2023 gparap

//get the number of all the todos stored in the blockchain
function getToDosCount() {
    contract.getToDosCount().then((count)=>{
      var element = document.getElementById("todos-count");
      element.innerHTML = "total: " + count;
    });
  }

//TODO: display all TODOs

//add a new to-do to the blockchain and display it on the page
function addToDo() {
  //get todo from input
  let name = document.getElementById("todo-name").value;
  let details = document.getElementById("todo-details").value;

  //create the todo
  contract.createToDo(name, details).then(()=>{
    getToDosCount();

    //get the last added todo
    contract.getCurrentId().then((id)=>{
      let lastId = parseInt(id) + 1;  //!!! idTracker is updated right after a new todo
      contract.getToDo(lastId).then((todo)=>{

        //display the last added todo TODO: fix the display
        var table = document.getElementById("todo-table");
        var tbody = table.getElementsByTagName("tbody")[0];
        var row = tbody.insertRow(0);
        var cell_1 = row.insertCell(0);
        var cell_2 = row.insertCell(1);
        var cell_3 = row.insertCell(2);
        var cell_4 = row.insertCell(3);
        var cell_5 = row.insertCell(4);
        cell_1.innerHTML += todo.id;
        cell_2.innerHTML += todo.name;
        cell_3.innerHTML += (new Date(todo.date * 1000)).toLocaleString();
        cell_4.innerHTML += todo.isCompleted;
        cell_5.innerHTML += ""; //TODO: action(s)
      });
    });
  });
}
