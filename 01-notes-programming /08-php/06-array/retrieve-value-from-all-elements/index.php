<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

            // array_value return new array with all elements' value
            print_r(array_values($my_array));
            # Array ( [0] => value1 [1] => value2 [2] => value3 ) 
        ?>
    </body>
</html>
