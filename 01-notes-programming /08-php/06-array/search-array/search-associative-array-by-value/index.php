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
                // array_search will return true when find match value in associative array
                if(array_search($value, $array)){
                    print("found match value");
                }  else {
                    print("no match value");
                }
            }

            search_my_array("value2", $my_array);
        ?>
    </body>
</html>
