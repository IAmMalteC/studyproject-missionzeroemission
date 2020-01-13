//these are the dependence
const express = require('express');
const app = express();
const mariadb = require('mariadb/callback');
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

//Database Connection
function getConnection() {
  return mariadb.createConnection({
    host: "141.45.92.87",
    user: "phpmyadmin",
    password: "Q2Jf6kY4aQuM",
    database: "DoriDB"
  });
}
// Connecting to Database
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

app.use(function(req,res,next){

  req.getcon= getConnection()

  next();

});
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

app.post('141.45.92.87:3003/profil', (req , res) => {
  const db = req.getConnection()
  console.log("Trying to log in..")
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;
  

  const queryString = "INSERT INTO DoriDB.nutzer_tb (nutzer_name, nutzer_vorname) SET (NULL,?,?,?,?,?,?,?,?)";
  getConnection().query(queryString, [Vorname , Nachname] , (err, result , fields) => {if (err) {
    Console.log ("Failed to update user data..." + err);
    res.sendStatus(500);
    return result
  }} );
  
  res.send('Data received:\n' + JSON.stringify(req.body));
  console.log("Inserted new user");
  res.end()
});




