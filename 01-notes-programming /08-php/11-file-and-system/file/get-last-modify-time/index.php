<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           $file = "test.php";
           echo "File last updated: ".date("m-d-y g:i:sa", filemtime($file));
            // change refer file attribute changes eg. read only
            // modify refer file content
            // File last updated: 09-18-10 9:58:29pm 
        ?>
    </body>
</html>
