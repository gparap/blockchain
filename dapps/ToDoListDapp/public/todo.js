// SPDX-License-Identifier: MIT
// © 2023 gparap

//get the number of all the todos stored in the blockchain
function getToDosCount() {
    contract.getToDosCount().then((count)=>{
      var element = document.getElementById("todos-count");
      element.innerHTML += count;
    });
  }

//get dummy data
function dummy() {
    contract.dummy().then((dummy)=>{
    var table = document.getElementById("todo-table");
    var tbody = table.getElementsByTagName("tbody")[0];
    var row = tbody.insertRow(0);
    var cell_1 = row.insertCell(0);
    var cell_2 = row.insertCell(1);
    var cell_3 = row.insertCell(2);
    var cell_4 = row.insertCell(3);
    var cell_5 = row.insertCell(4);
    cell_1.innerHTML = dummy["_id"];
    cell_2.innerHTML = dummy["_name"];
    cell_3.innerHTML = dummy["_details"];
    cell_4.innerHTML = (new Date(dummy["_timestamp"] * 1000)).toLocaleString();
    cell_5.innerHTML = dummy["_isCompleted"];
    });
}
