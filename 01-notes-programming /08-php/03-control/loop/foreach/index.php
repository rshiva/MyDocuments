<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // The foreach looping construct syntax is adept at looping through arrays, pulling each
            // key/value pair from the array until all items have been retrieved or some other internal
            // conditional has been met.

            // foreach to walk elements
            $links = array("www.apress.com","www.php.net","www.apache.org");
            foreach($links as $link) {
                echo "<a href=\"http://$link\">$link</a><br />";
            }

            // foreach with key and value
            $links = array(
                "The Apache Web Server" => "www.apache.org",
                "Apress" => "www.apress.com",
                "The PHP Scripting Language" => "www.php.net"
            );
            foreach($links as $title => $link) {
                echo "<a href=\"http://$link\">$title</a><br />";
            }
        ?>
    </body>
</html>
