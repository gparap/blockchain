// SPDX-License-Identifier: MIT
// © 2023 gparap

//create an express application
const express = require('express');
const app = express();

//mount the built-in middleware function at public path
app.use(express.static('public'))

//route HTTP GET request to index.html
app.get('/', (req, res) => {
    //transfer the file at the given path
    app.sendFiles(`${__dirname}/public/index.html`);
    app.status(200);
});

//listen for connections
app.listen('3000', () => {
    console.log(`Server started on port 3000...`);
});
