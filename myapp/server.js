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



app.get("/" , function(req , res , next){
  res.render('profil');
})
//app.get("/", (req, res) => {
//  console.log("Responding to root route")
//  res.send("helloooo...")
//})1

app.post('/', (req , res) => {
  console.log("Trying to log in..")
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;

  const queryString = "INSERT INTO NemoDB.Profil_TB (Profil_Name, Profil_Vorname) VALUES (default,?,?,?,?,?,?,?,?,?)";
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
    host: "localhost",
    user: "root",
    password: ""
  });
}


app.listen(3003, ()=>{
  console.log("server is up and listening on port 3003...")
})

//app.post("/profil" , function (req , res) {
//  console.log(req.body);
//  let sql = "INSERT INTO Profil_TB(profil_name, profil_vorname, profil_firma, profil_position, profil_fax, profil_tel, profil_email, profil_benutzername, profil_passwort) VALUES (null ,'" + req.body.NachnameInput + "' , '"+req.body.VornameInput+"' , '"+req.body.FirmennameInput+"', '"+req.body.PositionInput+"' ,'"+req.body.FaxInput+"' , '"+req.body.TelefonInput+"' , '"+req.body.EmailInput+"' , '"+ req.body.BenutzernameInput +"' , '"+req.body.PasswortInput+"')";
//  connection.query(sql , function (err) {
//    if (err) throw err;
//    res.send("Data Is added to the database...")
//  })
//});
//app.timeout = 0;
//app.listen("3306");

// comment being the name of the database

