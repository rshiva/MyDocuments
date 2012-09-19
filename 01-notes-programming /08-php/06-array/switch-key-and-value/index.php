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

            // switch key and value
            print_r(array_flip($my_array1));
            #  Array ( [value1] => 0 [value2] => 1 [value3] => 2 [value4] => 3 ) 
        ?>
    </body>
</html>
