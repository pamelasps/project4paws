//Setting dependencies
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
const PORT = 3000;

const app = express();

app.use(cors());

// parse requests of content-type - application/json
app.use(bodyParser.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

//Test connection from server response
app.get('/', function (req, res) { 
    res.json({ message: "Welcome to 4Paws application." });
})

//Console current server localhost port connection
app.listen(PORT, function () {
    console.log("Server running on localhost: " + PORT);
});

//Database creation and connection
let db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: '4paws'

});

module.exports = db;

db.connect(function (err) {
    if (err) throw err;
    console.log("Database Connected!");
});

//Insert PetCarer registration into SITTER table in 4Paws database
//Towards server
app.post('/enroll', function (req, res) { 
    let postBody = req.body;
    //Console on Server terminal the body request from client
    console.log(postBody);
    //SQL query to be executed
    let sql = "INSERT INTO sitter SET ?";
    let postQuery = db.query(sql, postBody, (err, results) => {
        if (err) throw err;
        console.log('Registered!');
        //Message send to Client console as response for data received
       
        res.status(200).end(JSON.stringify(results.insertId));
        //let id = JSON.stringify(results.insertId);
        //console.log(id);

    });
    

});

//Get PetCarer info from SITTER table in 4Paws database
//Towards server

/*
app.get('/carerProfile', (req, res) => { 
    //console.log(req.params);
    let sql = 'SELECT * FROM sitter';
    let query = db.query(sql, (err, results) => {
        if (err) throw err;
        console.log(results);
        res.send(results);
    });

});
*/

app.get('/carerProfile/:id', (req, res) => { 
    let requestedID = req.params.id;
    let sql = 'SELECT * FROM sitter where sitter_id = ?';
    let query = db.query(sql, requestedID, (err, results) => {
        if (err) throw err;
        console.log(results);
        //res.status(200).send(JSON.stringify(results));
        res.send(results);
    });

});

//Insert PetCarer registration into SITTER table in 4Paws database
//Towards server
app.post('/petOwner', function (req, res) { 
    let postBody = req.body;
    //Console on Server terminal the body request from client
    console.log(postBody);
    //SQL query to be executed
    let sql = "INSERT INTO owner SET ?";
    let postQuery = db.query(sql, postBody, (err, results) => {
        if (err) throw err;
        console.log('Registered!');
        //Message send to Client console as response for data received
       
        res.status(200).end(JSON.stringify(results.insertId));
        //let id = JSON.stringify(results.insertId);
        //console.log(id);

    });
    

});


