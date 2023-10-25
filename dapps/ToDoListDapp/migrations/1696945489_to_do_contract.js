var ToDoContract = artifacts.require("ToDoContract.sol");

module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
  _deployer.deploy(ToDoContract);
};
