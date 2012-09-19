<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // define convert list by array
            $table = array("<b>" => "<strong>", "</b>" => "</strong>");
            $html = "<b>Today In PHP-Powered News</b>";

            // strtr convert character in string as predefined standard
            echo strtr($html, $table);
            // <strong>Today In PHP-Powered News</strong>
        ?>
    </body>
</html>
