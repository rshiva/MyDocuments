<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $face = array("J","Q","K","A");
            $numbered = array("2","3","4","5","6","7","8","9");

            // using array_merge the duplicate element will be replace
            $cards = array_merge($face, $numbered);
            print_r($cards);
            print ("</br>");
            # Array ( [0] => J [1] => Q [2] => K [3] => A [4] => 2 [5] => 3 [6] => 4 [7] => 5 [8] => 6 [9] => 7 [10] => 8 [11] => 9 )

            $class1 = array("John" => 100, "James" => 85);
            $class2 = array("Micky" => 78, "John" => 45);
            // using array_merge_recursive the duplicate elements will be keep to make a new array
            $classScores = array_merge_recursive($class1, $class2);
            print_r($classScores);
            # Array ( [John] => Array ( [0] => 100 [1] => 45 ) [James] => 85 [Micky] => 78 ) 
        ?>
    </body>
</html>
