<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $fruits = array("d"=>"lemon", "a"=>"orange", "b"=>"banana", "c"=>"apple");
            print_r($fruits);
            print("</br>");
            // sort array by key
            ksort($fruits);
            print_r($fruits);
            print("</br>");
            // Array ( [d] => lemon [a] => orange [b] => banana [c] => apple )
            // Array ( [a] => orange [b] => banana [c] => apple [d] => lemon )
        ?>
        <?php
            $fruits = array("d"=>"lemon", "a"=>"orange", "b"=>"banana", "c"=>"apple");
            print_r($fruits);
            print("</br>");
            // sort array by key in reverse order
            krsort($fruits);
            print_r($fruits);
            print("</br>");
            // Array ( [d] => lemon [a] => orange [b] => banana [c] => apple )
            // Array ( [d] => lemon [c] => apple [b] => banana [a] => orange )
        ?>
    </body>
</html>
