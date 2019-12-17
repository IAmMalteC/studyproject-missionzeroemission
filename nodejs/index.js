const express = require('express');
const app = express();
const MariaDB = require('MariaDB');
const connection = MariaDB.createConnection({
  host: "141.45.92.87",
  user: "phpmyadmin",
  password : "Q2Jf6kY4aQuM",
  database : "NemoDB"
});

connection.connect(function (err) {
  if (err) throw err;

  console.log("Connected...")
});

app.post(, function (req , res) {
  console.log(req.body);
  var sql = "INSERT INTO Abfall VALUES (null ,  " + req.body.RestmullInput + "' , '" + req.body.WertstoffInput + "' , '" + req.body.BiogutInput + "' ,'" + req.body.PapierInput + "' , '" + req.body.GlasInput + "' , '" + req.body.SondermuellInput + "' )";
  connection.query(sql , function (err) {
    if(err) throw err;
    res.render('Abfall' , {title:'Data Saved' , message : 'Data Saved successfully.'})

  });
  connection.end()
});

app.listen(3306);
