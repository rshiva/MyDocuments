<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $author = "jason@example.com";
            // str_replace() replace string as specific
            $author = str_replace("@","(at)",$author);
            echo "Contact the author of this article at $author.";
        ?>
    </body>
</html>
