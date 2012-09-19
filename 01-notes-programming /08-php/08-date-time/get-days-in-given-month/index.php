<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           // get timestamp
            $lastday = mktime(0, 0, 0, 3, 0, 2007);
            printf("There are %d days in February 2007.", date("t",$lastday));
            // There are 28 days in February 2007. 

        ?>
    </body>
</html>
