<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // a global variable can be accessed in any part of the program.
            $somevar = 15;
            function addit() {
                // declare the variable is global, so it will not be trade as local variable
                GLOBAL $somevar;
                $somevar++;
                echo "Somevar is $somevar";
            }
            addit();

            function addit2() {
                // declare variable using $GLOBALS array.
                $GLOBALS["somevar"]++;
                echo "Somevar is ".$GLOBALS["somevar"];
            }
            addit2();
        ?>
    </body>
</html>
