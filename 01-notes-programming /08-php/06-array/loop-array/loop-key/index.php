<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

           // key() will return the element's key on current array pointer
            while($key=  key($my_array)){
               print ("$key </br>");
               // move array pointer to next position
               next($my_array);
           }
        ?>
    </body>
</html>
