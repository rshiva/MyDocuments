<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // Splitting a String  Based on a Case-Sensitive Pattern
            $text = "this is\tsome text that\nwe might like to parse.";
            print_r(split("[\n\t]",$text));
            // Array ( [0] => this is [1] => some text that [2] => we might like to parse. )

            // Splitting a String  Based on a Case-Insensitive Pattern
            // The spliti() function operates exactly in the same manner as its sibling, split(),
            // except that its pattern is treated in a case-insensitive fashion.
        ?>
    </body>
</html>
