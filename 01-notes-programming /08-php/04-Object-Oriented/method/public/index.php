<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Visitors{
                // Public methods can be accessed from anywhere at any time.
                public function greetVisitor(){
                    echo "Hello<br />";
                }
                function sayGoodbye(){
                    echo "Goodbye<br />";
                }
            }

            // call public function
            Visitors::greetVisitor();
            $visitor = new Visitors();
            // call public function
            $visitor->sayGoodbye();
            //
            //
        ?>
    </body>
</html>
