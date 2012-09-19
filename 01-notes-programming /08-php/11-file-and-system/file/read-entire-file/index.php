<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           $file = "/home/www/data/users.txt";
            // Open the file for reading
            $fh = fopen($file, "rt");

            // Read in the entire file
            // fread() ignore new line character
            $userdata = fread($fh, filesize($file));

            // readfile() read new line character
            // $userdata = readfile($file);
            
            // Close the file handle
            fclose($fh);
        ?>
    </body>
</html>
