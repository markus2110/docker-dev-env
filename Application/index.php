<?php

echo "Welcome PHP " . phpversion();

$dbh = new PDO('mysql:host=mysql_db;dbname=test-db', 'root', 'password');

$results = $dbh->query('SELECT * from table1');

echo "<pre>";

foreach($results as $row){
    print_r($row);
}

echo "</pre>";


#var_dump($_ENV);
