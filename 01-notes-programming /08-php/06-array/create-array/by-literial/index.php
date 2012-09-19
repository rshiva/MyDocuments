<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            //create array by literial
            $myArray[0]="a";
            $myArray[1]="b";
            $myArray[2]="c";
            print_r($myArray);
            # Array ( [0] => a [1] => b [2] => c )

            $myArray2[]="d";
            $myArray2[]="e";
            $myArray2[]="f";
            print_r($myArray2);
            # Array ( [0] => d [1] => e [2] => f )
            
            // create associative array
            $state["Delaware"] = "December 7, 1787";
            $state["Pennsylvania"] = "December 12, 1787";
            $state["New Jersey"] = "December 18, 1787";
            print_r($state);
            # Array ( [Delaware] => December 7, 1787 [Pennsylvania] => December 12, 1787 [New Jersey] => December 18, 1787 ) 
            //
        ?>
    </body>
</html>
