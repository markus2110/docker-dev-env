<?php

echo "<h3>Imagick Test</h3>";
$im = new Imagick("unnamed.png");

$im->flopImage();
$im->flipImage();
$im->blurImage(20,5);

$mimetype = $im->getImageMimeType();
$img = base64_encode($im->getImage());

echo "<table>";
    echo "<tr>";
        echo "<th>Original</th>";
        echo "<th>Imagick</th>";
    echo "</tr>";

    echo "<tr>";
        echo "<td><img src=\"./unnamed.png\" style=\"width:100px;\" /></td>";
        echo "<td><img src=\"data:$mimetype;base64,$img\" style=\"width:100px;padding:10px;\" /></td>";
    echo "</tr>";
echo "</table>";
echo "<hr />";
