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

//index
app.get('/', function(req, res) {
  res.render('index');
});
app.get('/index', function(req, res) {
  res.render('index');
});
//Maßnahmenkatalog
app.get('/massnahmen-katalog', function(req, res) {
  res.render('massnahmen-katalog');
});
//Eingabenauswahl
app.get('/eingabeauswahl', function(req, res) {
  res.render('eingabeauswahl');
});
//profil
app.get("/profil" , function(req , res , next){
  res.render('profil');
});
//Login
app.get('/login', function(req, res) {
  res.render('login');
});
//Passwort-Vergessen
app.get('/passwort-vergessen', function(req, res) {
  res.render('passwort-vergessen');
});
//RESSOURCEN
//Strom
app.get('/ressourcen/strom', function(req, res) {
  res.render('./ressourcen/strom');
});
app.get('../ressourcen/strom', function(req, res) {
  res.render('/ressourcen/strom');
});
//Heizung
app.get('/ressourcen/heizung', function(req, res) {
  res.render('/ressourcen/heizung');
});
app.get('../ressourcen/heizung', function(req, res) {
  res.render('/ressourcen/heizung');
});
//Erdgas
app.get('/ressourcen/erdgas', function(req, res) {
  res.render('/ressourcen/erdgas');
});
app.get('../ressourcen/erdgas', function(req, res) {
  res.render('/ressourcen/erdgas');
});
//Wasser
app.get('/ressourcen/wasser', function(req, res) {
  res.render('/ressourcen/wasser');
});
app.get('../ressourcen/wasser', function(req, res) {
  res.render('/ressourcen/wasser');
});
//Abfall
app.get('/ressourcen/abfall', function(req, res) {
  res.render('/ressourcen/abfall');
});
app.get('../ressourcen/abfall', function(req, res) {
  res.render('/ressourcen/abfall');
});
//Neue-Massnahme
app.get('/ressourcen/neue-massnahme', function(req, res) {
  res.render('/ressourcen/neue-massnahme');
});
app.get('../ressourcen/neue-massnahme', function(req, res) {
  res.render('/ressourcen/neue-massnahme');
});
//Umsatz
app.get('/ressourcen/umsatz', function(req, res) {
  res.render('/ressourcen/umsatz');
});
//CO2Schaetzung
app.get('/ressourcen/co2schaetzung', function(req, res) {
  res.render('./ressourcen/co2schaetzung');
});
//app.get("/", (req, res) => {
//  console.log("Responding to root route")
//  res.send("helloooo...")
//})1

app.post('/', (req , res) => {
  console.log("Trying to log in..")
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;

  const queryString = "INSERT INTO DoriDB.nutzer_tb (nutzer_nachname, nutzer_name) VALUES (default,?,?,?,?,?,?)";
  getConnection().query(queryString, [Vorname , Nachname] , (err, result , fields) => {if (err) {
    Console.log ("Failed to update user data..." + err);
    res.sendStatus(500);
    return
  }} );
  
  res.send('Data received:\n' + JSON.stringify(req.body));
  console.log("Inserted new user");
  res.end()
});

function getConnection() {
  return mariadb.createConnection({
    host: "141.45.92.87",
    user: "phpmyadmin",
    password: "Q2Jf6kY4aQuM",
    database: "DoriDB"
  });
}

// getConnection().createConnection((err) => {
//   if(err) {
//     console.log("Failed" + err);
//   }
//   else
//   console.log("Database connected");
// });

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

