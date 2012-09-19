<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php

            class Employee{
                
                private $name;
                public function set_name($name){
                    // Private property are only accessible from within the class in which they are defined.
                    $this->name=$name;
                }

                public function get_name(){
                    print($this->name);
                }
            }

            $stuff=new Employee();
            $stuff->set_name("harry"); # update private property by public method
            $stuff->get_name();
        ?>
    </body>
</html>
