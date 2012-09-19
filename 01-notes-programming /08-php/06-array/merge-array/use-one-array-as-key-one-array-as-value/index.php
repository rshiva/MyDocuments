<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $abbreviations = array("AL","AK","AZ","AR");
            $states = array("Alabama","Alaska","Arizona","Arkansas");
            // merge 2 array use one as key another as value
            $stateMap = array_combine($abbreviations,$states);
            print_r($stateMap);
            // Array ( [AL] => Alabama [AK] => Alaska [AZ] => Arizona [AR] => Arkansas ) 
        ?>
    </body>
</html>
