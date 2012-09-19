<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("value1","value2","value1","value3");
            // array_count_values return new array to count all elements
            // Array ( [value1] => 2 [value2] => 1 [value3] => 1 ) 
            print_r(array_count_values($my_array));
            
        ?>
    </body>
</html>
