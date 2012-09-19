<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // create array from range
            $myArray=  range(0, 6);
            print_r($myArray);
            # Array ( [0] => 0 [1] => 1 [2] => 2 [3] => 3 [4] => 4 [5] => 5 [6] => 6 )

            // create array with setp range
            $myArray2=  range(0, 6, 2);
            print_r($myArray2);
            # Array ( [0] => 0 [1] => 2 [2] => 4 [3] => 6 ) 
        ?>
    </body>
</html>
