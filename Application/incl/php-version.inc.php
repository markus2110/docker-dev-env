<?php

echo "<h1>Welcome PHP " . phpversion() . " - ". $_SERVER['BUILD_STAGE'] ."</h1>";
echo "<hr />";
echo "<h3>Used php.ini</h3>";
echo  $_SERVER['PHP_SETTINGS_SRC'];
echo "<hr />";

