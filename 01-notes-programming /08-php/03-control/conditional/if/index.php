<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $secretNumber = 453;
            $_POST['guess'] = 442;

            if ($_POST['guess'] == $secretNumber) {
                 echo "<p>Congratulations!</p>";
            } elseif (abs ($_POST['guess'] - $secretNumber) < 10) {
                echo "<p>You're getting close!</p>";
            } else {
                echo "<p>Sorry!</p>";
            }
        ?>
    </body>
</html>
