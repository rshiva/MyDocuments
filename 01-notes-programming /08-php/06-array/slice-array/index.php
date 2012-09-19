<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $states = array("Alabama", "Alaska", "Arizona", "Arkansas","California", "Colorado", "Connecticut");

            // slice array base on specificd start and end position
            $subset = array_slice($states, 4,2);
            print_r($subset);
            print("</br>");
            // Array ( [0] => California [1] => Colorado ) 
        ?>

        <?php
            $states = array("Alabama", "Alaska", "Arizona", "Arkansas","California", "Connecticut");
            // array_splice will remove specificd elements from array and return those elements as new array
            $subset = array_splice($states, 4);
            print_r($states);
            print("</br>");
            print_r($subset);
            // Array ( [0] => Alabama [1] => Alaska [2] => Arizona [3] => Arkansas )
            // Array ( [0] => California [1] => Connecticut )
        ?>
    </body>
</html>
