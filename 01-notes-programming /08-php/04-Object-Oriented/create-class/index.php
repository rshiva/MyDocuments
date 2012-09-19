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
                private $title;
                protected $wage;

                protected function clockIn() {
                    echo "Member $this->name clocked in at ".date("h:i:s");
                }
                protected function clockOut() {
                    echo "Member $this->name clocked out at ".date("h:i:s");
                }
            }
        ?>
    </body>
</html>
