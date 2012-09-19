<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // sort array in reverse order and break key and value pair
            $grades = array(42,98,100,100,43,12);
            print_r($grades);
            print("</br>");
            rsort($grades);
            print_r($grades);
            print("</br>");
            // Array ( [0] => 42 [1] => 98 [2] => 100 [3] => 100 [4] => 43 [5] => 12 )
            // Array ( [0] => 100 [1] => 100 [2] => 98 [3] => 43 [4] => 42 [5] => 12 )
        ?>

        <?php
            // sort array in reverse order and keep key and value pair
            $grades = array(42,98,100,100,43,12);
            print_r($grades);
            print("</br>");
            arsort($grades);
            print_r($grades);

            // Array ( [0] => 42 [1] => 98 [2] => 100 [3] => 100 [4] => 43 [5] => 12 )
            // Array ( [3] => 100 [2] => 100 [1] => 98 [4] => 43 [0] => 42 [5] => 12 )
        ?>
    </body>
</html>
