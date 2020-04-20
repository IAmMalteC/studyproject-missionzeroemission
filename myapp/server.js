//these are the dependencies
const express = require('express');
const app = express();
const session = require('express-session');
//const mariadb = require('mariadb/callback');
const morgan = require('morgan')
const bodyParser = require('body-parser');
const path = require('path');
const flash = require('connect-flash');
const cookieParser = require('cookie-parser');
const functions = require('./functions');


//shows what is happening on the server(Logger)
app.use(morgan('short'))

app.set('views', path.join(__dirname, 'public')); 
app.set('view engine', 'ejs'); 

//session
app.use(cookieParser())
app.use(session({
  secret: 'So0usiQJUS")Jlasihf8Yaisnd$$"($/§HFSIsd',
  resave: false,
  saveUninitialized: true,
	cookie: {maxAge : 5000000000000000}
}));
app.use(flash())

//body Parser is a middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(path.resolve(__dirname, 'public')));


//index routing
app.get('/index',functions.findEmissionAll,functions.findEmissionAllAverage,functions.renderIndexPage
  );

//Maßnahmenkatalog
app.get('/massnahmen-katalog', function (req, res) {
  if(req.session.loggedIn){
    var queryString = "SELECT res_kategorie_tb.res_kategorie_id, res_kategorie_tb.res_kategorie_name, massnahmen_tb.massnahmen_name, massnahmen_tb.massnahmen_beschreibung FROM massnahmen_tb INNER JOIN res_kategorie_tb ON massnahmen_tb.massnahmen_res_kategorie = res_kategorie_tb.res_kategorie_id ORDER BY res_kategorie_tb.res_kategorie_id";

  functions.getConnection().query(queryString, function (err, result) {
    if (err) {
      console.log("Failed to get massnahmen_tb data..." + err);
      res.sendStatus(500);
      return res.status(204).send();
    } else {
      return res.render('massnahmen-katalog', { page: 'Maßnahmenkatalog', menuId: 'massnahmen-katalog', massnahmen: result });
    }
  });
  }
  else
  {
    req.flash('message', 'please log in first!')
    res.redirect('/')
  }
  
});
//Maßnahmenübersicht
app.get('/massnahmen-uebersicht', function (req, res) {
  
  var queryString = "SELECT res_kategorie_tb.res_kategorie_name, massnahmen_tb.massnahmen_id, massnahmen_tb.massnahmen_name, massnahmen_tb.massnahmen_beschreibung, firma_tb.firma_name, mn_firma_massnahmen_tb.mn_firma_massnahmen_anfangsdatum FROM mn_firma_massnahmen_tb INNER JOIN firma_tb ON mn_firma_massnahmen_tb.mn_firma_massnahmen_firma = firma_tb.firma_id INNER JOIN massnahmen_tb ON mn_firma_massnahmen_tb.mn_firma_massnahmen_massnahme = massnahmen_tb.massnahmen_id INNER JOIN res_kategorie_tb ON massnahmen_tb.massnahmen_res_kategorie= res_kategorie_tb.res_kategorie_id ORDER BY firma_tb.firma_name ";

  functions.getConnection().query(queryString, function (err, result) {
    if (err) {
      console.log("Failed to get massnahmen_tb data..." + err);
      res.sendStatus(500);
      return res.status(204).send();
    } else {
      return res.render('massnahmen-uebersicht', { page: 'Maßnahmen Übersicht', menuId: 'massnahmen-uebersicht', massnahmen: result });
    }

  });
});

app.get('/eingabeauswahl',
functions.findEmissionCompany, functions.findEmissionCompanyCompareBranch,
functions.findActionCompany,
functions.renderEingabeauswahlPage);
//profil
app.get("/profil", function (req, res, next) {
  if(req.session.loggedIn){
    res.render('profil', { page: 'Profil', menuId: 'profil' });
  }
  else{
    req.flash('message', 'Please login first!')
    res.redirect('/')
  }
  
});
// Input Data from Profil to DB
app.post('/profil', function (req, res) {
  console.log("Trying to log in..")
  console.log("First name: " + req.body.VornameInput);
  const Vorname = req.body.VornameInput;
  const Nachname = req.body.NachnameInput;
  const Firma = req.body.FirmennameInput;
  const Email = req.body.emailInput;
  const Telephone = req.body.TelefonInput;

  var queryString = "INSERT INTO nutzer_tb VALUE (NULL,?,?,?,?,?,CURRENT_TIMESTAMP)";
  functions.getConnection().query(queryString, [Vorname, Nachname, Firma, Email, Telephone], function (err, result) {
    if (err) {
      console.log("Failed to update user data..." + err);
      res.sendStatus(500);
      return res.status(204).send();
    }
  });
  console.log("Inserted new user");
  res.end()
});
//Logout
app.get('/logout', function(req, res){
  if (req.session.loggedIn){
    req.session.destroy()
    res.redirect('/');
  }
  else
  {
    req.flash('message', 'Please login first!')
    res.redirect('/');
  }
  
});

//Login
app.get('/', function (req, res) {
  res.render('login', { page: 'Login', menuId: 'login', message: req.flash('message') });
});

app.post("/login", function (req, res) {
  var username = req.body.BenutzernameInput;
  var password = req.body.PasswortInput;
  loginQuery = "SELECT firma_benutzername, firma_passwort, firma_id FROM firma_tb WHERE firma_benutzername = ? AND firma_passwort = ?";

  if (username && password) {
    functions.getConnection().query(loginQuery, [username, password], function (err, result) {
      if (result.length > 0) {
        req.session.loggedIn = true;
        req.session.username = username;
        req.flash('message', 'You have successfully logged in!');
        res.redirect('/index')
      }
      else {
        req.flash('message', 'Username or Password is wrong');
        res.redirect('/')
        // res.send("Incorrect username and/or password")
      }
      
    });
  }
  else {
    // res.send("Please enter your Username and Password");
    res.end();
  }
});
//Passwort-Vergessen
app.get('/passwort-vergessen', function (req, res) {
  res.render('passwort-vergessen', { page: 'Passwort vergessen', menuId: 'passwort-vergessen' });
});
//FAQ
app.get('/faq', function (req, res) {
  res.render('faq', { page: 'FAQ', menuId: 'faq' });
});
//RESSOURCEN
//Strom
app.get('/ressourcen/strom', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/strom', { page: 'Strom', menuId: 'strom' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
  
  });

app.post('/strom', function (req, res) {
  console.log('Entering Strom Data..')

  var StromArt = req.body.StromArt; // emissionwert
  if (StromArt == "Photovoltaik") {
    StromArt = 0 // emissionwert
  }
  else {
    StromArt = 474
  }
  var Ablesung = req.body.Ablesung;
  if (Ablesung == "monatlich") {
    Ablesung = 1
  }
  else {
    Ablesung = 2
  }
  const StromVerbrauch = req.body.Stromverbrauch;
  const AbrechnungZeitraum = req.body.ZeitraumJahr;
  if (StromArt == 0) {
    console.log("Entering Data into Photov table")
    var sqlQuery = "INSERT INTO res_strom_photov_tb VALUES (NULL,4,?,?,1,?,?)"
    functions.getConnection().query(sqlQuery, [StromArt, Ablesung, AbrechnungZeitraum, StromVerbrauch], function (err, result) {
      if (err) {
        console.log("Faild to Insert into database..." + err);
        res.sendStatus(500);
        return
      }
    });
  }
  else {
    console.log("Entering Data into regulaer table")
    var stromQuery = "INSERT INTO res_strom_regulaer_tb VALUE (NULL,4,?,?,1,?,?)";
    functions.getConnection().query(stromQuery, [StromArt, Ablesung, AbrechnungZeitraum, StromVerbrauch], function (err, result) {
      if (err) {
        console.log("Faild to Insert into database..." + err);
        res.sendStatus(500);
        return
      }
    });
  }
  res.redirect('/ressourcen/strom');
});
 //Heizung
 app.get('/ressourcen/heizung', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/heizung', { page: 'Heizung', menuId: 'heizung' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
 });
 //Erdgas
 app.get('/ressourcen/erdgas', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/erdgas', { page: 'Gas', menuId: 'erdgas' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
 });

 app.post('/gas', function(req, res){
  var Ablesung = req.body.Ablesung;
  if (Ablesung == "monatlich") {
    Ablesung = 1
  }
  else {
    Ablesung = 2
  }
  const AbrechnungZeitraum = req.body.ZeitraumJahr; 
  const GasVerbrauchMenge = req.body.GasverbrauchMenge;
  
  var gasQuary = "INSERT INTO res_gas_tb VALUES (NULL,1,2750,?,2,?,?)";
  functions.getConnection().query(gasQuary, [Ablesung, AbrechnungZeitraum, GasVerbrauchMenge]), function(err, result){
    if (err){
      console.log('Failed to insert data'+ err);
      res.sendStatus(500);
      return
    }
  }
  console.log('Entering data into gas table')
  res.redirect('/ressourcen/erdgas');
 })
 //Wasser
 app.get('/ressourcen/wasser', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/wasser', { page: 'Wasser', menuId: 'wasser' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
 });
 //Abfall
 app.get('/ressourcen/abfall', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/abfall', { page: 'Abfall', menuId: 'abfall' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
   
 });
 //Neue-Massnahme
 app.get('/ressourcen/neue-massnahme', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/neue-massnahme', { page: 'Neue Maßnahme', menuId: 'neue-massnahme' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
 });
 //Umsatz
 app.get('/ressourcen/umsatz', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/umsatz', { page: 'Umsatz', menuId: 'umsatz' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
 });
app.post('/umsatz', function (req, res) {
  console.log("Entering sales data..")
  var JahresUmsatz = req.body.UmsatzInput;
  var Datum = req.body.ZeitraumJahr;
  // ADD firmenid = 11 //should be retrieved from a session

  var umsatzQuery = "INSERT INTO umsatz_tb VALUE (NULL,12,?,?,NULL)";
  functions.getConnection().query(umsatzQuery, [Datum, JahresUmsatz], function (err, result) {
    if (err) {
      console.log("Failed to Insert into the database..." + err);
    }
  });

  console.log("Inserted new umsatz Data");
  res.redirect('/ressourcen/umsatz')
})
//CO2Schaetzung
app.get('/ressourcen/co2schaetzung', function (req, res) {
  if(req.session.loggedIn){
    res.render('./ressourcen/co2schaetzung', { page: 'CO2 Schätzung', menuId: 'co2schaetzung' });
  }
  else{
    req.flash('message', 'Please log in first!')
    res.redirect('/')
  }
});

app.listen(3003, () => {
  console.log("server is up and listening on port 3003...")
});