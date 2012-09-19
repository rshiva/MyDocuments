<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            for ($count = 0; $count < 10; $count++)
            {
                $randomNumber = rand(1,50);
                if ($randomNumber < 10){
                    // use goto can suddenly jump to a specific location outside of a
                    // looping or conditional construct.
                    goto less;
                }else{
                    echo "Number greater than 10: $randomNumber<br />";
                }
            }

            less:
                echo "Number less than 10: $randomNumber<br />";
        ?>
    </body>
</html>
