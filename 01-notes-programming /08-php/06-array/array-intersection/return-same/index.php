<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $array1 = array("OH","CA","NY","HI","CT");
            $array2 = array("OH","CA","HI","NY","IA");
            $array3 = array("TX","MD","NE","OH","HI");
            // array_intersect values in first array that also persent in second and other arrays
            $intersection = array_intersect($array1, $array2, $array3);
            print_r($intersection);
            print("</br>");
            // Array ( [0] => OH [3] => HI ) 
        ?>

        <?php
            $array1 = array("OH" => "Ohio", "CA" => "California", "HI" => "Hawaii");
            $array2 = array("50" => "Hawaii", "CA" => "California", "OH" => "Ohio");
            $array3 = array("TX" => "Texas", "MD" => "Maryland", "OH" => "Ohio");
            // array_intersection_assoc is same as array_intersect but it campare key and value for associative array
            $intersection = array_intersect_assoc($array1, $array2, $array3);
            print_r($intersection);
            // Array ( [OH] => Ohio ) 
        ?>
    </body>
</html>
