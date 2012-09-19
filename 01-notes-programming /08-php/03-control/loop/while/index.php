<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           $count = 1;
            while ($count < 5) {
                printf("%d squared = %d <br />", $count, pow($count, 2));
                $count++;
            }
        ?>
    </body>
</html>
