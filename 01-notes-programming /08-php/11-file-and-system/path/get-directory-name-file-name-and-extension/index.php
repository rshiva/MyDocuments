<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $pathinfo = pathinfo("/home/www/htdocs/book/chapter10/index.html");
            print_r($pathinfo);
            // Array ( [dirname] => /home/www/htdocs/book/chapter10 [basename] => index.html [extension] => html [filename] => index ) 

            printf("Dir name: %s <br />", $pathinfo[dirname]);
            // Dir name: /home/www/htdocs/book/chapter10 

            printf("Base name: %s <br />", $pathinfo[basename]);
            // Base name: index.html 

            printf("Extension: %s <br />", $pathinfo[extension]);
            // Extension: html 
            
        ?>
    </body>
</html>
