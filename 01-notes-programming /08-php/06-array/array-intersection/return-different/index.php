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
            // array_diff return values in first array but not in second and other arrays
            $diff = array_diff($array1, $array2, $array3);
            print_r($diff);
            print("</br>");
            // Array ( [4] => CT )
        ?>

        <?php
            $array1 = array("OH" => "Ohio", "CA" => "California", "HI" => "Hawaii");
            $array2 = array("50" => "Hawaii", "CA" => "California", "OH" => "Ohio");
            $array3 = array("TX" => "Texas", "MD" => "Maryland", "KS" => "Kansas");
            // array_diff_assoc is same as array_diff but it compare key and value for associative array
            $diff = array_diff_assoc($array1, $array2, $array3);
            print_r($diff);
            // Array ( [HI] => Hawaii ) 
        ?>
    </body>
</html>
