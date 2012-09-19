<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3","key4"=>"value4");

            function print_out($key,$value){
               print ("$key : $value  </br>");
            }

            // array_walk loop all elements pass to a function
            array_walk($my_array, 'print_out');
            /*
             * value1 : key1
             * value2 : key2
             * value3 : key3
             * value4 : key4
             */
        ?>
    </body>
</html>
