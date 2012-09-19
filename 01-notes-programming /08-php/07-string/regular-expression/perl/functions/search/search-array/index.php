<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $foods = array("pasta", "steak", "fish", "potatoes");
            // The preg_grep() function searches all elements of an array, returning an array consisting
            // of all elements matching a certain pattern.
            $food = preg_grep("/^p/", $foods);
            print_r($food);
            // Array ( [0] => pasta [3] => potatoes ) 
        ?>
    </body>
</html>
