<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array1=array("value1","value2","value3","value4");
            $my_array2=array("key1"=>"value","key2"=>"value2","key3"=>"value3");

            // array_reverse will reverse all elements
            print_r(array_reverse($my_array1));
            # Array ( [0] => value4 [1] => value3 [2] => value2 [3] => value1 ) 
        ?>
    </body>
</html>
