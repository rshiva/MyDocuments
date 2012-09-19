<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $delimitedText = "Jason+++Gilmore+++++++++++Columbus+++OH";
            $fields = preg_split("/\+{1,}/", $delimitedText);
            print_r($fields);
            // Array ( [0] => Jason [1] => Gilmore [2] => Columbus [3] => OH ) 
        ?>
    </body>
</html>
