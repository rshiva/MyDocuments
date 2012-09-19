<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            echo "April 31, 2007: ".(checkdate(4, 31, 2007) ? 'Valid' : 'Invalid');
            // Returns false, because April only has 30 days

            echo "February 29, 2004: ".(checkdate(02, 29, 2004) ? 'Valid' : 'Invalid');
            // Returns true, because 2004 is a leap year

            echo "February 29, 2007: ".(checkdate(02, 29, 2007) ? 'Valid' : 'Invalid');
            // Returns false, because 2007 is not a leap year
        ?>
    </body>
</html>
