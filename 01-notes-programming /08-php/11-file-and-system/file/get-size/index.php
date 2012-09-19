<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $file = "1.jpg";
            //filesize method will get specific file size
            $bytes = filesize($file);
            $kilobytes = round($bytes/1024, 2);
            printf("File %s is $bytes bytes, or %.2f kilobytes",basename($file), $kilobytes);
            // File 1.jpg is 53034 bytes, or 51.79 kilobytes 
        ?>
    </body>
</html>
