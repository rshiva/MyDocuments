<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           // Build list of acceptable tags
            $tags = "<h2><h3><p><b><a><img>";

            // Open the article, and read its contents.
            $fh = fopen("article.html", "rt");

            while (!feof($fh)) {
                // The fgetss() function operates similarly to fgets(), except that
                // it also strips anyHTML and PHP tags from the input.
                $article= fgetss($fh, 1024, $tags);
            }

            // Close the handle
            fclose($fh);
        ?>
    </body>
</html>
