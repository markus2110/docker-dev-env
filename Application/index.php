<?php

echo "<h1>Welcome PHP " . phpversion() ."</h1>";

var_dump($_ENV);

// try{
//     $r = mail('mail@example.docker', 'The Mail Subject', "The mail text");
//     var_dump($r);
// }catch(\Exception $e ){
//     var_dump($e);
//     die("error");
// }




// echo "<h2>MySQL Test</h2>";
// $dbh = new PDO('mysql:host=db;dbname=test_db', 'webuser', '#secretPassword!');

// $results = $dbh->query('SELECT * from table1');

// echo "<pre>";

// foreach($results as $row){
//     print_r($row);
// }

// echo "</pre>";


// echo "<h2>Memcache Test</h2>";

// $mc = new Memcached();
// $mc->addServer("memcache", 11211);

// var_dump($mc->getStats());

// $mc->set("foo", "Hello!");
// $mc->set("bar", "Memcached...");

// $arr = array(
//     $mc->get("foo"),
//     $mc->get("bar")
// );
// var_dump($arr); 



