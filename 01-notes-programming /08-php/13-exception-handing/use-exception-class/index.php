<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            try {
                $fh = fopen("contacts.txt", "r");

                // if file open fail, throw error
                if (! $fh) {
                    throw new Exception("Could not open the file!");
                }
            }
            // catch the error and execute the code block
            catch (Exception $e) {
                // use exception class getFile(), getLine(), getMessage() method to get error details
                echo "Error (File: ".$e->getFile().", line ". $e->getLine()."): ".$e->getMessage();
                // Error (File: /usr/local/apache2/htdocs/8/read.php, line 6): Could not open the file!
            }
        ?>
    </body>
</html>
