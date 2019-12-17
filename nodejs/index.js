const express = require('express');
const app = express();
const MariaDB = require("MariaDB");
const db = new MariaDB.Database("NemoDB/");
const bodyParser = require("body-parser");
const connection = ({
  host: "141.45.92.87",
  user: "phpmyadmin",
  password : "Q2Jf6kY4aQuM",
  database : "NemoDB"
});
connection.connect();
app.listen("3306");

app.post("/profil.html" , function (req , res) {
  var sql = req.body. "INSERT INTO Profil_TB VALUES (r)"
})

// comment being the name of the database

