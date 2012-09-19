<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $text = "This is a link to http://www.wjgilmore.com/.";
            // The preg_replace() function operates identically to ereg_replace(), except that it
            // uses a Perl-based regular expression syntax, replacing all occurrences of pattern with
            // replacement, and returning the modified result.
            echo preg_replace("/http:\/\/(.*)\//", "<a href=\"\${0}\">\${0}</a>", $text);
            // This is a link to
            // <a href="http://www.wjgilmore.com/">http://www.wjgilmore.com/</a>.

            // the pattern and replacement input parameters can also be arrays.
            $draft = "In 2007 the company faced plummeting revenues and scandal.";
            $keywords = array("/faced/", "/plummeting/", "/scandal/");
            $replacements = array("celebrated", "skyrocketing", "expansion");
            echo preg_replace($keywords, $replacements, $draft);
            // In 2007 the company celebrated skyrocketing revenues and expansion.
        ?>
    </body>
</html>
