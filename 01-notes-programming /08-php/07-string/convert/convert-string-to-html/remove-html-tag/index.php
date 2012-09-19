<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $input = "Email <a href='spammer@example.com'>spammer@example.com</a>";
            echo strip_tags($input);
            // Email spammer@example.com
        ?>
    </body>
</html>
