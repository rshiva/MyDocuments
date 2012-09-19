<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $pswd = "1245";
            $pswd2 = "67";

            // strcspn compare 2 string
            // returns the length of the first segment of a string containing
            // characters not found in another string.
            print(strcspn($pswd, $pswd2)); //4

        ?>
    </body>
</html>
