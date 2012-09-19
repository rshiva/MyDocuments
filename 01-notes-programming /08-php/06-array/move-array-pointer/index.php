<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3","key4"=>"value4");

            // move pointer to next 
            printf("%s </br>",next($my_array)); # value2

            // move pointer to previous
            printf("%s </br>",  prev($my_array)); # value1

            // move pointer to end
            printf("%s </br>",  end($my_array)); # value4

            // move pointer to beginning
             printf("%s </br>",  reset($my_array)); # value1
        ?>
    </body>
</html>
