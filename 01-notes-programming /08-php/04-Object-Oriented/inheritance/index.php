<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
             class Employee
            {
                protected $name;
                function __construct()
                {
                    echo "<p>Staff constructor called!</p>";
                }
            }

            // use keyword extend for inheritance
            class Manager extends Employee
            {
                function __construct()
                {
                    // call parent constructor
                    // if the child doesn't has constructor, the program will call parent constructor
                    // if the child has constructor, program will call child constructor,
                    // the parent constructor will not be call automatically. unless do it manually
                    parent::__construct();
                    // if the parent has parent, we call several constructor in this way
                    // parent_class_name::__construct();
                    // grand_parent_class_name::__construct();
                    echo "<p>Manager constructor called!</p>";
                }
            }
            $employee = new Manager();
        ?>
    </body>
</html>
