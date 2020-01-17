<?php
// PHP request for Revenue made by all companys
//setting header to json
header('Content-Type: application/json');

//database
define('DB_HOST', '141.45.92.87');
define('DB_USERNAME', 'phpmyadmin');
define('DB_PASSWORD', 'Q2Jf6kY4aQuM');
define('DB_NAME', 'DoriDB');
//get connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

if(!$mysqli){
  die("Connection failed: " . $mysqli->error);
}

//query to get data from the table
$query = sprintf("SELECT umsatz_jahr, SUM(umsatz_umsatz) AS umsatz_umsatz FROM umsatz_tb GROUP BY umsatz_jahr ORDER BY umsatz_jahr");

//execute query
$result = $mysqli->query($query);

//loop through the returned data
$data = array();
foreach ($result as $row) {
  $data[] = $row;
}

//free memory associated with result
$result->close();

//close connection
$mysqli->close();

//now print the data
print json_encode($data);