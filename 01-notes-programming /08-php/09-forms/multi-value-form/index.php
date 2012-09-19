<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!--
        There are two common methods for passing data from one script to another: GET and POST.
        post can handle more information than get
         -->
        
        <form action="<?php echo $_SERVER['PHP_SELF']; // posting data back to the same script from using super global $_SERVER['PHP_SELF'] ?>" method="post">
            What's your favorite programming language?<br /> (check all that apply):<br />
            <input type="checkbox" name="languages[]" value="csharp" />C#<br />
            <input type="checkbox" name="languages[]" value="jscript" />JavaScript<br />
            <input type="checkbox" name="languages[]" value="perl" />Perl<br />
            <input type="checkbox" name="languages[]" value="php" />PHP<br />
            <input type="submit" name="submit" value="Submit!" />
        </form>

        <?php
            if (isset($_POST['submit']))
            {
                echo "You like the following languages:<br />";
                foreach($_POST['languages'] AS $language) {
                    $language = htmlentities($language);
                    echo "$language<br />";
                }
            }
        ?>
    </body>
</html>
