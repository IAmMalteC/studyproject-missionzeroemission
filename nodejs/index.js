
const express = require('express');
const app = express();
const mariadb = require('mariadb');
const bodyParser = require('body-parser');
//body Parser is a middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.post('profil.html', (req , res) => {
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;

  const queryString = "INSERT INTO NemoDB.Profil_TB (Profil_Name, Profil_Vorname) VALUES (default,?,?,?,?,?,?,?,?,?)";
  getConnection().query(queryString, [Vorname , Nachname] , (err, result , fields) => {} );
  if (err) {
    Console.log ("Failed to update user data..." + err);
    res.sendStatus(500);
    return
  }
  console.log("Inserted new user");
  res.end()
});

function getConnection() {
  return mariadb.createConnection({
    host: "141.45.92.87",
    user: "root",
    password: "r2qUh75W",
    database: "NemoDB"
  });
}


app.listen(3306);

//app.post("/profil.html" , function (req , res) {
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

