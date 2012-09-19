<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           $file = "test.php";
           printf("File last accessed: %s", date("m-d-y g:i:sa", fileatime($file)));
           // File last accessed: 09-18-10 9:58:59pm 
        ?>
    </body>
</html>
