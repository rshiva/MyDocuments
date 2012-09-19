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
            array_unshift($myArray, "new value"); # add new value to front of array
            print_r($myArray);
            # Array ( [0] => new value [1] => value1 [2] => value2 [3] => value3 )
        ?>
    </body>
</html>
