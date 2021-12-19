// create an Express application
var express = require('express');
var app = express();
var port = 9999;

// create a basic route 
app.get('/', (request, response) => {
    response.sendFile(__dirname + '/index.html');
});

// listen for connections
app.listen(port);