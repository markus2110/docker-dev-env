<?php

echo "<h2>Memcache Test</h2>";

$mc = new Memcached();
$mc->addServer("memcache", 11211);

var_dump($mc->getStats());

$mc->set("foo", "Hello!");
$mc->set("bar", "Memcached...");

$arr = array(
    $mc->get("foo"),
    $mc->get("bar")
);
var_dump($arr);
echo "<hr />";