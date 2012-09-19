<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Employee{
                private $ein;

                // Class methods marked as protected are available 
                // only to the originating class and its subclasses.
                protected function verifyEIN($ein){
                    return TRUE;
                }
            }

            
        ?>
    </body>
</html>
