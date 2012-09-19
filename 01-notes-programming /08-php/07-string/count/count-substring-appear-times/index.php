<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
$talk = <<< talk
I'm certain that we could dominate mindshare in this space with
our new product, establishing a true synergy between the marketing
and product development teams. We'll own this space in three months.
talk;

print(substr_count($talk,"space")); //2
        ?>
    </body>
</html>
