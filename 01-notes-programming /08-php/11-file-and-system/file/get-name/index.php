<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $path = "/home/www/data/users.txt";

            // basename() will return file name
            printf("Filename: %s <br />", basename($path));
            // Filename: users.txt 
            printf("Filename sans extension: %s <br />", basename($path, ".txt"));
            // Filename sans extension: users 
        ?>
    </body>
</html>
