<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // by default. the variable passed to function will work as local variable
            // it will not affact the variable out of the function
            $number=4;
            calculate($number);
            function calculate($number){
                $number+=1;
                print ("Number in function = $number </br>");
            }
            print ("Number out function = $number </br>");

            // use reference argument. the variable passed to function
            // it will affect the variable out of the function
            $iNumber = 10;
            calculate2($iNumber);
            function calculate2(&$number){
                $number+=1;
                print ("Number in function = $number </br>");
            }
            print ("Number in function = $iNumber </br>");
        ?>
    </body>
</html>
