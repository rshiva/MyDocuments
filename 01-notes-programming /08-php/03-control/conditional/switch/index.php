<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $category = "news";
            
            switch($category) {
                case "news":
                    echo "<p>What's happening around the world</p>";
                    break;
                case "weather":
                    echo "<p>Your weekly forecast</p>";
                    break;
                case "sports":
                    echo "<p>Latest sports highlights</p>";
                    break;
                default:
                    echo "<p>Welcome to my Web site</p>";
            }
        ?>
    </body>
</html>
