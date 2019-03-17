<?php

echo "Welcome PHP " . phpversion();

$dbh = new PDO('mysql:host=mysql_db;dbname=test_db', 'root', 'password');

$results = $dbh->query('SELECT * from new_table');

echo "<pre>";

foreach($results as $row){
    print_r($row);
}

echo "</pre>";


#var_dump($_ENV);
