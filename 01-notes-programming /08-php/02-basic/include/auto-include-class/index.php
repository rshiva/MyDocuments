<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // Autoloading allows you to define a special __autoload function
            // that is automatically called whenever
            // a class is referenced that hasn’t yet been defined in the script.

            function __autoload($class) {
                require_once("classes/$class.class.php");
            }
        ?>
    </body>
</html>
