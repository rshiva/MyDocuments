<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // return single value
            function cauculate($price,$tax){
                return $price+($price*$tax);
            }
            print(cauculate(100, 0.1));
            print("</br>");

            // return multi value
            function getDetail(){
                // return multi value using array
                $user[]="harry";
                $user[]="harry@redant.com.au";
                return $user;
            }
            
            list ($name,$email)=  getDetail(); # create a list to receive the multi value
            print ("Name:$name, Email:$email");
        ?>
    </body>
</html>
