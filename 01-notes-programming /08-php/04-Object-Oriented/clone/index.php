<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Corporate_Drone {
                private $employeeid;

                // __clone will be called when class been cloned
                function __clone() {
                    print("call from _clone method </br>");
                }

                function setEmployeeID($employeeid) {
                    $this->employeeid = $employeeid;
                }
                function getEmployeeID() {
                    return $this->employeeid;
                }
            }

            $drone1 = new Corporate_Drone();
            $drone1->setEmployeeID("12345");
            // clone th instance, if the class has __clone method, the method will be called
            $drone2 = clone $drone1;
            $drone2->setEmployeeID("67890");

            printf("drone1 employeeID: %d <br />", $drone1->getEmployeeID());
            printf("drone2 employeeID: %d <br />", $drone2->getEmployeeID());

            // call from _clone method
            // drone1 employeeID: 12345
            // drone2 employeeID: 67890
        ?>
    </body>
</html>
