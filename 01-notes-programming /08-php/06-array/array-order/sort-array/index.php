<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $grades = array(42,98,100,100,43,12);
            print_r($grades);
            print("</br>");
            // sort array break key and value pair
			sort($grades);
            print_r($grades);

            // Array ( [0] => 42 [1] => 98 [2] => 100 [3] => 100 [4] => 43 [5] => 12 )
            // Array ( [0] => 12 [1] => 42 [2] => 43 [3] => 98 [4] => 100 [5] => 100 )
        ?>
		
		<?php
            $grades = array(42,98,100,100,43,12);
            print_r($grades);
            print("</br>");
            // sort array keep key and value pair
			asort($grades);
            print_r($grades);

            // Array ( [0] => 42 [1] => 98 [2] => 100 [3] => 100 [4] => 43 [5] => 12 )
            // Array ( [5] => 12 [0] => 42 [4] => 43 [1] => 98 [2] => 100 [3] => 100 ) 
        ?>
    </body>
</html>
