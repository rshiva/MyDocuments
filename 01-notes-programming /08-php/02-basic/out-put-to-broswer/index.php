<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $season = "summertime";
            // print() will return 1 if the statement is successfully output.
            // "" output variable
            // '' output escape
            print "<p>I love the $season.</p>"; # I love the summertime.
            print '<p>I love the $season.</p>'; # I love the $season.
        ?>

        <?php
            // echo() function is a tad faster because it returns nothing
            // "" output variable
            // '' output escape
           $season = "summertime";
           echo "<p>I love the $season."; # I love the summertime.
           echo '<p>I love the $season.'; # I love the $season.
        ?>

        <?php
            // %d. %f is place holder will replace by the variable following
            // more information about all kind of placeholder check php doc
            printf("%d bottles of tonic water cost $%f", 100, 43.20); # 100 bottles of tonic water cost $43.200000
        ?>

    </body>
</html>
