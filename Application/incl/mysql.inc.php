<?php

echo "<h3>MySQL Test</h3>";
$dbh = new PDO('mysql:host=db;dbname=test_db', 'webuser', '#secretPassword!');
$results = $dbh->query('SELECT * from table1');
echo "<pre>";
foreach($results as $row){
    print_r($row);
}
echo "</pre>";
echo "<hr />";