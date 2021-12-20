// create an Express application
var express = require('express');
var app = express();

// create a web3 instance and set a provider
const Web3 = require('web3');
var web3 = new Web3('http://localhost:8545');

// create a basic route 
app.get('/', (request, response) => {
    response.sendFile(__dirname + '/index.html');
});

// create a route for getting the blockchain accounts
app.get('/blockchain-accounts', (request, response) => {
    // send a list of accounts the node controls
    web3.eth.getAccounts(function(error, addresses) {
        if (error == null) {
            response.send(JSON.stringify(addresses));
        }
    });
});

// listen for connections
app.listen(9999);