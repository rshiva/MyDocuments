<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // First, the file will be included in the script in which the require() construct appears,
        // regardless of where require() is located. For instance, if require() is placed within an
        // if statement that evaluates to false, the file would be included anyway.

        // The second important difference is that script execution will stop if a require()
        // fails, whereas it may continue in the case of an include().

        require 'include.php';
        require_once 'include.php'; #make sure file will be include once only
        ?>
    </body>
</html>
