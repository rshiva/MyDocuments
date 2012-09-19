<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("value1","value2","value1","value3");
            // array_unique remove all duplicate elements
            // Array ( [0] => value1 [1] => value2 [3] => value3 ) 
            print_r(array_unique($my_array));
        ?>
    </body>
</html>
