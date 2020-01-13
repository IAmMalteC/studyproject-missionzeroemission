//these are the dependence
const express = require('express');
const app = express();
const mariadb = require('mariadb');
const morgan = require ('morgan')
const bodyParser = require('body-parser');
const path = require('path')

//shows what is happening on the server and post it on the terminal(Logger)
app.use(morgan('short'))

app.set('views', path.join(__dirname, 'public')); //changed from 'views' to 'public'
app.set('view engine', 'ejs'); //changed from 'jade' to 'ejs'

//body Parser is a middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(path.resolve(__dirname, 'public')));

//Routing
//It is messy and a crappy solution, but it works for now, until a new link is added, then it has to be implented here as well. Solution would be to understand express routing
//index
app.get('/', function(req, res) {
  res.render('index', {page:'Startseite', menuId:'index'})
}),
app.get('/index', function(req, res) {
  res.render('index', {page:'Startseite', menuId:'index'});
});
//Maßnahmenkatalog
app.get('/massnahmen-katalog', function(req, res) {
  res.render('massnahmen-katalog', {page:'Maßnahmen-Katalog', menuId:'massnahmen-katalog'});
});
//Eingabenauswahl
app.get('/eingabeauswahl', function(req, res) {
  res.render('eingabeauswahl', {page:'Eingabeauswahl', menuId:'eingabeauswahl'});
});
//profil
app.get("/profil" , function(req , res , next){
  res.render('profil', {page:'Profil', menuId:'profil'});
});
//Login
app.get('/login', function(req, res) {
  res.render('login', {page:'Login', menuId:'login'});
});
//Passwort-Vergessen
app.get('/passwort-vergessen', function(req, res) {
  res.render('passwort-vergessen', {page:'Passwort vergessen', menuId:'passwort-vergessen'});
});
//RESSOURCEN
//Strom
app.get('/ressourcen/strom', function(req, res) {
  res.render('./ressourcen/strom', {page:'Strom', menuId:'strom'});
});
//Heizung
app.get('/ressourcen/heizung', function(req, res) {
  res.render('./ressourcen/heizung', {page:'Heizung', menuId:'heizung'});
});
//Erdgas
app.get('/ressourcen/erdgas', function(req, res) {
  res.render('./ressourcen/erdgas', {page:'Gas', menuId:'erdgas'});
});
//Wasser
app.get('/ressourcen/wasser', function(req, res) {
  res.render('./ressourcen/wasser', {page:'Wasser', menuId:'wasser'});
});
//Abfall
app.get('/ressourcen/abfall', function(req, res) {
  res.render('./ressourcen/abfall', {page:'Abfall', menuId:'abfall'});
});
//Neue-Massnahme
app.get('/ressourcen/neue-massnahme', function(req, res) {
  res.render('./ressourcen/neue-massnahme', {page:'Neue Maßnahme', menuId:'neue-massnahme'});
});
//Umsatz
app.get('/ressourcen/umsatz', function(req, res) {
  res.render('./ressourcen/umsatz', {page:'Umsatz', menuId:'umsatz'});
});
//CO2Schaetzung
app.get('/ressourcen/co2schaetzung', function(req, res) {
  res.render('./ressourcen/co2schaetzung', {page:'CO2 Schätzung', menuId:'co2schaetzung'});
});
app.post('/' , function(req , res){
  console.log("Trying to log in..")
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;
  const Firma = req.body.FirmennameInput;
  const Email = req.body.emailInput;
  const Telephone = req.body.telephoneInput;
  

  var queryString = "INSERT INTO nutzer_tb () VALUES (NULL,?,?,?,?,?)";
  getConnection().query(queryString, [null,Vorname , Nachname , Firma , Email , Telephone] ,function (err, result) {if (err) {
    console.log ("Failed to update user data..." + err);
    res.sendStatus(500);
    return
  }} );
  
  res.send('Data received:\n' + JSON.stringify(req.body));
  console.log("Inserted new user");
  res.end()
})

// app.get('/', (req , res) => {
//   console.log("Trying to log in..")
//   console.log("First name: " + req.body.VornameInput);
//   const Vorname = req.body.VornameInput;
//   const Nachname = req.body.NachnameInput;

//   const queryString = "INSERT INTO DoriDB.nutzer_tb (nutzer_nachname, nutzer_name) VALUES (default,?,?,?,?,?,?)";
//   getConnection().query(queryString, [Vorname , Nachname] , (err, result , fields) => {if (err) {
//     console.log ("Failed to update user data..." + err);
//     res.sendStatus(500);
//     return
//   }} );
  
//   res.send('Data received:\n' + JSON.stringify(req.Vorname , req.Nachname));
//   console.log("Inserted new user");
//   res.end()
// });

function getConnection() {
  return mariadb.createConnection({
    host: "141.45.92.87",
    user: "phpmyadmin",
    password: "Q2Jf6kY4aQuM",
    database: "DoriDB"
  });
}

getConnection().connect((err) => {
  if(err) {
    console.log("Failed" + err);
  }
  else
  console.log("Database connected");
});

app.listen(3003, ()=>{
  console.log("server is up and listening on port 3003...")
});

//app.post("/profil" , function (req , res) {
//  console.log(req.body);
//  let sql = "INSERT INTO nutzer_tb(profil_name, profil_vorname, profil_firma, profil_position, profil_fax, profil_tel, profil_email, profil_benutzername, profil_passwort) VALUES (null ,'" + req.body.NachnameInput + "' , '"+req.body.VornameInput+"' , '"+req.body.FirmennameInput+"', '"+req.body.PositionInput+"' ,'"+req.body.FaxInput+"' , '"+req.body.TelefonInput+"' , '"+req.body.EmailInput+"' , '"+ req.body.BenutzernameInput +"' , '"+req.body.PasswortInput+"')";
//  connection.query(sql , function (err) {
//    if (err) throw err;
//    res.send("Data Is added to the database...")
//  })
//});
//app.timeout = 0;
//app.listen("3306");

// comment being the name of the database

