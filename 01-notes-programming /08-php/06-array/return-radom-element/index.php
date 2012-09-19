<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $states = array("Ohio" => "Columbus", "Iowa" => "Des Moines","Arizona" => "Phoenix");
            // return random values as specificed
            $randomStates = array_rand($states, 2);
            print_r($randomStates);
            // Array ( [0] => Iowa [1] => Arizona ) 
        ?>
    </body>
</html>
