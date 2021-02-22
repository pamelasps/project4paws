const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');


const PORT = 3000;
const app = express();

app.use(bodyParser.json());

app.use(cors());

let db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: '4paws'

});

app.get('/', function (req, res) { //from server
    res.send('Hello from server');
})

app.post('/enroll', function (req, res) { //towards server
    console.log(req.body);
    let postBody = req.body;

    let name = postBody.name;
    let email = postBody.email;
    let city = postBody.city;
    let province = postBody.province;
    let postcode = postBody.postcode;
    let country = postBody.country;
    let phone = postBody.phone;

    db.query('INSERT INTO carer (name, email, city, province, postcode, country, phone) VALUES (?,?,?,?,?,?,?)', [name, email, city, province, postcode, country, phone],
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