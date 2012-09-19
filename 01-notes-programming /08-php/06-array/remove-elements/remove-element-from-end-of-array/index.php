<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // create array from range
            $myArray=  array("value1","value2","value3");
            array_pop($myArray); # remove value from end of array
            print_r($myArray);
            # Array ( [0] => value1 [1] => value2 )
        ?>
    </body>
</html>
