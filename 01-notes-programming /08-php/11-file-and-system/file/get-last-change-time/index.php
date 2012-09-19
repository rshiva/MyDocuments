<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           $file = "test.php";
          printf("File inode last changed: %s", date("m-d-y g:i:sa", filectime($file)));
            // change refer file attribute changes eg. read only
            // modify refer file content
            // File inode last changed: 09-18-10 9:58:10pm
        ?>
    </body>
</html>
