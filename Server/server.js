const express = require('express');
const bodyParser = require('body-parser');
//const cors = require('cors');
const mysql = require('mysql');


const PORT = 3000;
const app = express();

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json());

//app.use(cors());

let db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: '4paws'

});

db.connect(function(err) {
    if (err) throw err;
    console.log("Database Connected!");
  });
  module.exports = db;

app.get('/', function (req, res) { //from server
    res.send('Hello from server');
})

app.post('/enroll', function (req, res) { //towards server
    //console.log(req.body);
    let postBody = req.body;
    console.log(postBody);
   
    let firstName = postBody.firstName;
    let lastName = postBody.lastName
    let email = postBody.email;
    let city = postBody.city;
    let province = postBody.province;
    let postcode = postBody.postcode;
    let country = postBody.country;
    let phone = postBody.phone;
    let dob = postBody.dob;

    let photo = postBody.photo;
    let breedPref = postBody.breedPref;
    let carerNeighbor = postBody.carerNeighbor;
    let aboutCarer = postBody.aboutCarer;
    let bgcheck = postBody.bgcheck;
    let hPrice = postBody.hPrice;

//'INSERT INTO sitter (sitter_firstname, sitter_lastname, sitter_email, sitter_phone, sitter_dob, sitter_photo, sitter_policeCheck, sitter_price) VALUES (?,?,?,?,?,?,?,?)', [firstName, lastName, email, phone, dob, photo, bgCheck, hPrice]


/*
    db.query('INSERT INTO carer (name, email, city, province, postcode, country, phone) VALUES (?,?,?,?,?,?,?)', [firstName, email, city, province, postcode, country, phone],
        (err, res) => {
            if (err) {
                console.log(err);
            } else {
                console.log('Registered!');
            }

        });
        */

        db.query('INSERT INTO sitter (sitter_firstname, sitter_lastname, sitter_email, sitter_phone, sitter_dob, sitter_photo, sitter_policeCheck, sitter_price) VALUES (?,?,?,?,?,?,?,?)', [firstName, lastName, email, phone, dob, photo, bgcheck, hPrice],
        (err, res) => {
            if (err) {
                console.log(err);
            } else {
                console.log('Registered!');
            }

        });
        

    res.status(200).send({ "message": "Data Received" });
   
});

app.listen(PORT, function () {
    console.log("Server running on localhost: " + PORT);
});