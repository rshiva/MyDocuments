<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // sort array in reverse order and break key and value pair
            $grades = array("picture1.jpg", "picture10.jpg", "picture2.jpg", "picture20.jpg");
            sort($grades);
            print_r($grades);
            // Array ( [0] => picture1.jpg [1] => picture10.jpg [2] => picture2.jpg [3] => picture20.jpg )
            print("</br>");
            // sort array naturally
            natsort($grades);
            print_r($grades);
            // Array ( [0] => picture1.jpg [2] => picture2.jpg [1] => picture10.jpg [3] => picture20.jpg ) 
        ?>
    </body>
</html>
