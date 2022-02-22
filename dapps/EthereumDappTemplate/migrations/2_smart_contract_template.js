const Template = artifacts.require("SmartContractTemplate");

module.exports = function (deployer) {
  deployer.deploy(Template);
};
