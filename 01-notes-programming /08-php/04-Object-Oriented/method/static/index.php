<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Visitor{
                // define static variable
                // the static variable shared by all class instance
                private static $visitors = 0;
                function __construct(){
                    // refer private static variable by self:: not this ->
                    self::$visitors++;
                }
                // define static function
                // same as static property, static method are shared by all class instance
                static function getVisitors(){
                    return self::$visitors;
                }
            }
            
            /* Instantiate the Visitor class. */
            $visits = new Visitor();
            echo Visitor::getVisitors()."<br />";
            /* Instantiate another Visitor class. */
            $visits2 = new Visitor();
            // call static function using :: not ->
            echo Visitor::getVisitors()."<br />";
            // 1
            // 2
        ?>
    </body>
</html>
