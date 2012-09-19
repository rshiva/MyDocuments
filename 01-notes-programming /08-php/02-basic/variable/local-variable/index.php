<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // A variable declared in a function is considered local.
            $x = 4;
            function assignx () {
                $x = 0;
                printf("\$x inside function is %d <br />", $x);
            }
            assignx();
            printf("\$x outside of function is %d <br />", $x);

            # $x inside function is 0
            # $x outside of function is 4
        ?>
    </body>
</html>
