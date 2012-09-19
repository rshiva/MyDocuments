<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $myArray=array("value1","value2","value3");

            function serach_my_array($array,$string){
                // in_array search specific value in array
                // return true when find match
                if(in_array($string, $array)){
                    print("found match");
                } else {
                    print("No match");
                }
            }

            serach_my_array($myArray, "value1");
        ?>
    </body>
</html>
