<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $my_array=array("key1"=>"value1","key2"=>"value2","key3"=>"value3");

            function search_my_array($value,$array){
                // array_key_exist return true when find match key in associative array
                if(array_key_exists($value, $array)){
                    print("found match key");
                }  else {
                    print("no match key");
                }
            }

            search_my_array("key2", $my_array);
        ?>
    </body>
</html>
