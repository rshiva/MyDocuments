<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $username = "jasoN";

            // case-sensitive search
            // The ereg() function executes a case-sensitive search of a string for a defined pattern,
            // returning TRUE if the pattern is found, and FALSE otherwise.
            if (ereg("([^a-z])",$username)){
                echo "Username must be all lowercase!";
            }else{
                echo "Username is all lowercase!";
            }

            // Case-Insensitive Search
            // The eregi() function searches a string for a defined pattern in a case-insensitive fashion.
            $string = 'XYZ';
            if (eregi('z', $string)) {
                echo "'$string' contains a 'z' or 'Z'!";
            }

        ?>
    </body>
</html>
