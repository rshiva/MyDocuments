<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            //Replacing Text in a Case-Sensitive Fashion
            $num = '4';
            $string = "This string has four words.";
            $string = ereg_replace('four', $num, $string);
            echo $string;
            //This string has 4 words.

            //Replacing Text in a Case-Insensitive Fashion
            // The eregi_replace() function operates exactly like ereg_replace(), except that the
            // search for pattern in string is not case sensitive.
        ?>
    </body>
</html>
