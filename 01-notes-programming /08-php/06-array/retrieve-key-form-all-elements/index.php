<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

            // array_keys return new array with all elements' key
            print_r(array_keys($my_array));
            # Array ( [0] => key1 [1] => key2 [2] => key3 ) 
        ?>
    </body>
</html>
