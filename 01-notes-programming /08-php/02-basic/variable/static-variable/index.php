<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // a static variable does not lose its value when the function exits
            // and will still hold that value if the function is called again.

            function keep_track() {
                // declare static variable
                STATIC $count = 0;
                $count++;
                echo $count;
                echo "<br />";
            }

            keep_track(); # 1
            keep_track(); # 2
            keep_track(); # 3
        ?>
    </body>
</html>
