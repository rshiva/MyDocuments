<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $iNumber = 10;
            // set default as certain value
            function calculate ($number, $tax=10){
                $result=$number*$tax;
                print ("$result </br>");
            }
            calculate($iNumber);

            // set default as optional
            function greet($string1, $string2=""){
                print ("$string1 </br>");
                print ("$string2 </br>");
            }

            greet("s1","s2");
            greet("s1");
        ?>
    </body>
</html>
