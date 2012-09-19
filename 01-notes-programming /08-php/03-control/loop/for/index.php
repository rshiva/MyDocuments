<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            for ($kilometers = 1; $kilometers <= 5; $kilometers++) {
                printf("%d kilometers = %f miles <br />", $kilometers, $kilometers*0.62140);
            }
        ?>
    </body>
</html>
