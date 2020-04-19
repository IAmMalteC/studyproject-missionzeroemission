const mariadb = require('mariadb/callback');

function getConnection() {
  return mariadb.createConnection({
    host: "141.45.92.87",
    user: "phpmyadmin",
    password: "Q2Jf6kY4aQuM",
    database: "DoriDB"
  });
}

getConnection().connect((err) => {
  if (err) {
    console.log("Failed" + err);
  }
  else
    console.log("Database connected");
});

function findEmissionAll(req, res, next) {
    var sqlquery = "SELECT res_strom_regulaer_jahr, SUM(res_strom_regulaer_jahresverbrauch) AS nemo_strom_regulaer_jahresverbrauch, SUM(res_strom_photov_tb.res_strom_photov_jahresverbrauch) AS gesamt_photov_jahresverbrauch, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))/1000000 ) AS nemo_strom_gesamtemission, SUM((res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)/1000000 ) AS nemo_strom_emissionseinsparung, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission))/1000000 ) AS nemo_strom_gesamtemission_theoretisch, SUM(umsatz_tb.umsatz_umsatz) AS nemo_gesamtumsatz, SUM(umsatz_tb.umsatz_umsatz*1000000)/SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))) AS nemo_umsatz_pro_emission FROM res_strom_regulaer_tb JOIN res_strom_photov_tb ON res_strom_regulaer_tb.res_strom_regulaer_firma = res_strom_photov_tb.res_strom_photov_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = res_strom_photov_tb.res_strom_photov_jahr JOIN umsatz_tb ON umsatz_tb.umsatz_firma = res_strom_regulaer_tb.res_strom_regulaer_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = umsatz_tb.umsatz_jahr GROUP BY res_strom_regulaer_tb.res_strom_regulaer_jahr";
    getConnection().query(sqlquery, function (err, result) {
      if (err) {
        console.log("Failed to get year data..." + err);
        res.sendStatus(500);
        return res.status(204).send();
      } else {
        req.emissionAll = result;
        return next();
      }
    });
  }
  //emission Alle Durchschnitt
  function findEmissionAllAverage(req, res, next) {
    var sqlquery = "SELECT res_strom_regulaer_jahr, SUM(res_strom_regulaer_jahresverbrauch)/COUNT(res_strom_regulaer_firma) AS nemo_strom_regulaer_jahresverbrauch, SUM(res_strom_photov_tb.res_strom_photov_jahresverbrauch)/COUNT(res_strom_regulaer_firma) AS gesamt_photov_jahresverbrauch, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))/1000000 )/COUNT(res_strom_regulaer_firma) AS nemo_strom_gesamtemission, SUM((res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)/1000000 )/COUNT(res_strom_regulaer_firma) AS nemo_strom_emissionseinsparung, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission))/1000000 )/COUNT(res_strom_regulaer_firma) AS nemo_strom_gesamtemission_theoretisch, SUM(umsatz_tb.umsatz_umsatz)/COUNT(res_strom_regulaer_firma) AS nemo_gesamtumsatz, SUM(umsatz_tb.umsatz_umsatz*1000000)/SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission)))/COUNT(res_strom_regulaer_firma) AS nemo_umsatz_pro_emission, COUNT(res_strom_regulaer_firma) AS anzahl_firmen FROM res_strom_regulaer_tb JOIN res_strom_photov_tb ON res_strom_regulaer_tb.res_strom_regulaer_firma = res_strom_photov_tb.res_strom_photov_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = res_strom_photov_tb.res_strom_photov_jahr JOIN umsatz_tb ON umsatz_tb.umsatz_firma = res_strom_regulaer_tb.res_strom_regulaer_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = umsatz_tb.umsatz_jahr GROUP BY res_strom_regulaer_tb.res_strom_regulaer_jahr";
    getConnection().query(sqlquery, function (err, result) {
      if (err) {
        console.log("Failed to get year data..." + err);
        res.sendStatus(500);
        return res.status(204).send();
      } else {
        req.emissionAllAverage = result;
        return next();
      }
    });
  }

  function renderIndexPage(req, res) {
    res.render('index', {
      page: 'Startseite', menuId: 'index',
      emissionAlle: req.emissionAll, emissionAlleDurchschnitt: req.emissionAllAverage
    });
  }

  //Eingabenauswahl mit Graphen
//Emission Firma
function findEmissionCompany(req, res, next) {
    firmenid = 11; //get from session 
    var sqlquery = "SELECT res_strom_regulaer_id, res_strom_regulaer_firma, res_strom_regulaer_jahr, res_strom_regulaer_jahresverbrauch, res_strom_photov_tb.res_strom_photov_jahresverbrauch, ((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))/1000000 AS strom_gesamtemission, (res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)/1000000 AS strom_emissionseinsparung, ((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission))/1000000 AS strom_gesamtemission_theoretisch, umsatz_tb.umsatz_umsatz, umsatz_tb.umsatz_umsatz*1000000/((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission)) AS umsatz_pro_emission FROM res_strom_regulaer_tb JOIN res_strom_photov_tb ON res_strom_regulaer_tb.res_strom_regulaer_firma = res_strom_photov_tb.res_strom_photov_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = res_strom_photov_tb.res_strom_photov_jahr JOIN umsatz_tb ON umsatz_tb.umsatz_firma = res_strom_regulaer_tb.res_strom_regulaer_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = umsatz_tb.umsatz_jahr WHERE res_strom_regulaer_firma = ?";
    getConnection().query(sqlquery, firmenid, function (err, result) {
      if (err) {
        console.log("Failed to get data..." + err);
        res.sendStatus(500);
        return res.status(204).send();
      } else {
        req.emissionCompany = result;
        return next();
      }
    });
  }

  //Emission Firma Vergleich mit Branche
  function findEmissionCompanyCompareBranch(req, res, next) {
    branchid = 4; //get from session 
    var sqlquery = "SELECT res_strom_regulaer_jahr, SUM(res_strom_regulaer_jahresverbrauch) AS gesamt_strom_regulaer_jahresverbrauch, SUM(res_strom_photov_tb.res_strom_photov_jahresverbrauch) AS gesamt_photov_jahresverbrauch, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))/1000000 ) AS branche_strom_gesamtemission, SUM((res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)/1000000 ) AS branche_strom_emissionseinsparung, SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission))/1000000 ) AS branche_strom_gesamtemission_theoretisch, SUM(umsatz_tb.umsatz_umsatz) AS branche_gesamtumsatz, branche_tb.branche_name, SUM(umsatz_tb.umsatz_umsatz*1000000)/SUM(((res_strom_regulaer_tb.res_strom_regulaer_jahresverbrauch * res_strom_regulaer_tb.res_strom_regulaer_emission)+(res_strom_photov_tb.res_strom_photov_jahresverbrauch * res_strom_photov_tb.res_strom_photov_emission))) AS branche_umsatz_pro_emission FROM res_strom_regulaer_tb JOIN res_strom_photov_tb ON res_strom_regulaer_tb.res_strom_regulaer_firma = res_strom_photov_tb.res_strom_photov_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = res_strom_photov_tb.res_strom_photov_jahr JOIN umsatz_tb ON umsatz_tb.umsatz_firma = res_strom_regulaer_tb.res_strom_regulaer_firma AND res_strom_regulaer_tb.res_strom_regulaer_jahr = umsatz_tb.umsatz_jahr JOIN firma_tb ON res_strom_regulaer_tb.res_strom_regulaer_firma = firma_tb.firma_id JOIN branche_tb ON branche_tb.branche_id = firma_tb.firma_branche WHERE branche_tb.branche_id=5 GROUP BY branche_tb.branche_name, res_strom_regulaer_tb.res_strom_regulaer_jahr";
    getConnection().query(sqlquery, branchid, function (err, result) {
      if (err) {
        console.log("Failed to get data..." + err);
        res.sendStatus(500);
        return res.status(204).send();
      } else {
        req.emissionCompanyBranch = result;
        return next();
      }
    });
  }
  
  // Maßnahmen der Firma = 
  function findActionCompany(req,res,next){
    firmenid = 11; //get from session 
    var sqlquery = "SELECT res_kategorie_tb.res_kategorie_name, massnahmen_tb.massnahmen_id, massnahmen_tb.massnahmen_name, massnahmen_tb.massnahmen_beschreibung, firma_tb.firma_name, mn_firma_massnahmen_tb.mn_firma_massnahmen_anfangsdatum FROM mn_firma_massnahmen_tb INNER JOIN firma_tb ON mn_firma_massnahmen_tb.mn_firma_massnahmen_firma = firma_tb.firma_id INNER JOIN massnahmen_tb ON mn_firma_massnahmen_tb.mn_firma_massnahmen_massnahme = massnahmen_tb.massnahmen_id INNER JOIN res_kategorie_tb ON massnahmen_tb.massnahmen_res_kategorie= res_kategorie_tb.res_kategorie_id WHERE firma_tb.firma_id = ? ORDER BY mn_firma_massnahmen_tb.mn_firma_massnahmen_anfangsdatum";
    getConnection().query(sqlquery, firmenid, function (err, result) {
      if (err) {
        console.log("Failed to get year data..." + err);
        res.sendStatus(500);
        return res.status(204).send();
      } else {
        req.actionCom = result;
        return next();
      }
    });
  }
  function renderEingabeauswahlPage(req, res) {
    //ggf. anpassen und das result der Query ansprechen über kolonnen name, müsste eigentlich in einer Session gespeichert sein und dort abgerufen werden.
    firma = "CFB – CNC Feinmechanik Berlin e. K."
    branchenname = "Maschinenbau"
    res.render('eingabeauswahl', {
      page: 'Eingabeauswahl', menuId: 'eingabeauswahl',
      firmenname: firma, branchenname: branchenname,
      emissionenFirma: req.emissionCompany, emissionFirmaVergleich: req.emissionCompanyBranch,
      massnahmen: req.actionCom
    });
  }

//exporting functions
module.exports = {findEmissionAll, findEmissionAllAverage, renderIndexPage, findEmissionCompany ,
                     findEmissionCompanyCompareBranch, findActionCompany, renderEingabeauswahlPage, getConnection }









// //profil
// app.get("/profil", function (req, res, next) {
//     res.render('profil', { page: 'Profil', menuId: 'profil' });
//   });
// //Login
// app.get('/', function (req, res) {
//     res.render('login', { page: 'Login', menuId: 'login' });
//   });
// app.get('/ressourcen/strom', function (req, res) {
//   res.render('./ressourcen/strom', { page: 'Strom', menuId: 'strom' });
// });
// //Heizung
// app.get('/ressourcen/heizung', function (req, res) {
//     res.render('./ressourcen/heizung', { page: 'Heizung', menuId: 'heizung' });
//   });

// //Erdgas
// app.get('/ressourcen/erdgas', function (req, res) {
//     res.render('./ressourcen/erdgas', { page: 'Gas', menuId: 'erdgas' });
//   });

// //Wasser
// app.get('/ressourcen/wasser', function (req, res) {
//     res.render('./ressourcen/wasser', { page: 'Wasser', menuId: 'wasser' });
//   });

// //Abfall
// app.get('/ressourcen/abfall', function (req, res) {
//     res.render('./ressourcen/abfall', { page: 'Abfall', menuId: 'abfall' });
//   });

// //Neue-Massnahme
// app.get('/ressourcen/neue-massnahme', function (req, res) {
//     res.render('./ressourcen/neue-massnahme', { page: 'Neue Maßnahme', menuId: 'neue-massnahme' });
//   });

// //Umsatz
// app.get('/ressourcen/umsatz', function (req, res) {
//     res.render('./ressourcen/umsatz', { page: 'Umsatz', menuId: 'umsatz' });
//   });

// app.get('/ressourcen/co2schaetzung', function (req, res) {
//     res.render('./ressourcen/co2schaetzung', { page: 'CO2 Schätzung', menuId: 'co2schaetzung' });
//   });
// //Passwort-Vergessen
// app.get('/passwort-vergessen', function (req, res) {
//     res.render('passwort-vergessen', { page: 'Passwort vergessen', menuId: 'passwort-vergessen' });
//   });

// //FAQ
// app.get('/faq', function (req, res) {
//     res.render('faq', { page: 'FAQ', menuId: 'faq' });
//   });