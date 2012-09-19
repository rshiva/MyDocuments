<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // Abstract methods are special in that they are declared only within a parent class but are
            // implemented in child classes. Only classes declared as abstract can contain abstract methods.
            abstract class Employee{
                abstract function hire();
                abstract function fire();
                abstract function promote();
            }

            
        ?>
    </body>
</html>
