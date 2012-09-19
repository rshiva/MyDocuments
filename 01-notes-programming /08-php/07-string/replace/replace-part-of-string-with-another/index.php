<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $ccnumber = "1234567899991111";
            echo substr_replace($ccnumber,"************",0,12);
            // ************1111 
        ?>
    </body>
</html>
