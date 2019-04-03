<?php

$header = 'From: webmaster@dev.docker' . "\r\n" .
    'Reply-To: webmaster@dev.docker' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();

   echo "<h3>SEND MAIL Testing</h3>";
   try{
       $r = mail('mail@dev.docker', 'The Mail Subject', "The mail text", $header);
       var_dump($r);

       echo "<a href='".sprintf("http://%s:%d", $_SERVER['HTTP_HOST'], 1080)."' target='_blank'>Mailcatcher</a>";

   }catch(\Exception $e ){
       var_dump($e);
       die("error");
   }
   echo "<hr />";
