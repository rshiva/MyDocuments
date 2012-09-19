<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $info = "J. Gilmore:jason@example.com|Columbus, Ohio";

            // define delimiter as : | ,
            $tokens = ":|,";
            // strtok split string by delimiter
            $tokenized = strtok($info, $tokens);

            print("$tokenized</br>"); //J. Gilmore

            while ($tokenized) {
                echo "$tokenized<br>";
                // Don't include the first argument in subsequent calls.
                // everytime strtok get called it use different delimiter
                // when no delimiter, stop the loop
                $tokenized = strtok($tokens);
            }
            //J. Gilmore
            //jason@example.com
            //Columbus
            //Ohio
        ?>
    </body>
</html>
