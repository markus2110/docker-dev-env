<?php

echo "<h1>Welcome PHP " . phpversion() . " - ". $_SERVER['ENVIRONMENT'] ." 2</h1>";
echo "<hr />";
echo "<h3>PHP INI File</h3>";
echo  $_SERVER['PHP_SETTINGS_SRC'];
echo "<hr />";

echo "<h3>ERROR Testing</h3>";
$x = ["Test"];
print_r($x[1]);
echo "<hr />";

echo "<h3>SEND MAIL Testing</h3>";
try{
     $r = mail('mail@example.docker', 'The Mail Subject', "The mail text");
     var_dump($r);

    echo "<a href='http://localhost:1080' target='_blank'>Mailcatcher</a>";

}catch(\Exception $e ){
     var_dump($e);
     die("error");
}
echo "<hr />";


echo "<h3>MySQL Test</h3>";
$dbh = new PDO('mysql:host=db;dbname=test_db', 'webuser', '#secretPassword!');
$results = $dbh->query('SELECT * from table1');
echo "<pre>";
foreach($results as $row){
    print_r($row);
}
echo "</pre>";
echo "<hr />";

echo "<h2>Memcache Test</h2>";

$mc = new Memcached();
$mc->addServer("memcache", 11211);

#var_dump($mc->getStats());

$mc->set("foo", "Hello!");
$mc->set("bar", "Memcached...");

$arr = array(
    $mc->get("foo"),
    $mc->get("bar")
);
var_dump($arr); 
echo "<hr />";


echo "<h3>Server VARs</h3>";
echo "<pre>";
var_dump($_SERVER);
echo "</pre>";


















