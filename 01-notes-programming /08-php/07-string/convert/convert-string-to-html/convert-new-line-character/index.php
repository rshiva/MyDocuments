<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $recipe = "3 tablespoons Dijon mustard
            1/3 cup Caesar salad dressing
            8 ounces grilled chicken breast
            3 cups romaine lettuce";

            // nl2br converts all newline (\n) characters to <br />
            echo nl2br($recipe);
            // 3 tablespoons Dijon mustard<br />
            // 1/3 cup Caesar salad dressing<br />
            // 8 ounces grilled chicken breast<br />
            // 3 cups romaine lettuce
        ?>
    </body>
</html>
