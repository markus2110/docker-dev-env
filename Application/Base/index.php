<?php
try{

    include_once './incl/php-version.inc.php';

    include_once './incl/php-errors.inc.php';

    include_once './incl/imagick.inc.php';

    include_once './incl/send-mail.inc.php';

    include_once './incl/mysql.inc.php';

    include_once './incl/memcached.inc.php';

    include_once './incl/server-vars.inc.php';





}catch(\Exception $e){
    
    print_r($e);
}

















