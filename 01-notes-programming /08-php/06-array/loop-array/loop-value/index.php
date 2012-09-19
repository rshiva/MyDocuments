<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

           // current() will return the element's value on current array pointer
            while($value=  current($my_array)){
               print ("$value </br>");
               // move array pointer to next position
               next($my_array);
           }
        ?>
    </body>
</html>
