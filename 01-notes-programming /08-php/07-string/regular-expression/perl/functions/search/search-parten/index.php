<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // The preg_match_all() function matches all occurrences of a pattern in a string,
            // assigning each occurrence to an array in the order you specify via an optional input parameter.
            $userinfo = "Name: <b>Zeev Suraski</b> <br> Title: <b>PHP Guru</b>";
            preg_match_all("/<b>(.*)<\/b>/U", $userinfo, $pat_array);
            printf("%s <br /> %s", $pat_array[0][0], $pat_array[0][1]);
            // Zeev Suraski
            // PHP Guru
        ?>
    </body>
</html>
