<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $pswd = "12345";
            $pswd2 = "1234567";

            // strspn() compare 2 string and returns the length of the first segment in a string containing
            // characters also found in another string.
            print(strspn($pswd, $pswd2)); // 5

        ?>
    </body>
</html>
