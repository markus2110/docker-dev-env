<?php
try{

    include_once './incl/php-version.inc.php';

    include_once './incl/php-errors.inc.php';

    include_once './incl/imagick.inc.php';

    include_once './incl/mysql.inc.php';

    include_once './incl/memcached.inc.php';

    include_once './incl/server-vars.inc.php';






//    echo "<h3>SEND MAIL Testing</h3>";
//    try{
//        $r = mail('mail@example.docker', 'The Mail Subject', "The mail text");
//        var_dump($r);
//
//        echo "<a href='http://localhost:1080' target='_blank'>Mailcatcher</a>";
//
//    }catch(\Exception $e ){
//        var_dump($e);
//        die("error");
//    }
//    echo "<hr />";








}catch(\Exception $e){
    
    print_r($e);
}

















