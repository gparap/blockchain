const Template = artifacts.require("SmartContractTemplate");

//Test smart contract using Mocha
contract("SmartContractTemplate", () => {
    it("Test if smart contract deployed correctly", async () =>{
        const template = await Template.deployed();
        assert(template.address !== "");
    });
});