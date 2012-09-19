<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

           // each will return key and value current array pointer
            while(list($key,$value) = each($my_array)){
               print ("$key = $value </br>");
           }
        ?>
    </body>
</html>
