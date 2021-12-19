// create an Express application
var express = require('express');
var app = express();

var port = 9999;

// create a response object to send
var responseObj = {key: "response object value"};

// create a basic route 
app.get('/', (request, response) => {
    response.sendFile(__dirname + '/index.html');
});

// create a route for pinging the web server
app.get('/ping', (request, response) => {
    // response.send("Pinging port " + port);
    response.send(JSON.stringify(responseObj));
});

// listen for connections
app.listen(port);