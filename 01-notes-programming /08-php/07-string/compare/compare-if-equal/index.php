<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $pswd = "supersecret";
            $pswd2 = "Supersecret";

            // strcmp compare 2 string with case sensitive
            // get 0 if str1 and str2 are equal
            // -1 if str1 is less than str2
            // 1 if str2 is less than str1
            print(strcmp($pswd,$pswd2)); // 1
            print ("</br>");

            // strcasecmp compare 2 string with case insensitive
            // get 0 if str1 and str2 are equal
            // -1 if str1 is less than str2
            // 1 if str2 is less than str1
            print(strcasecmp($pswd,$pswd2)); // 0
        ?>
    </body>
</html>
