<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // define interface, by conventence interface initial with I
            interface IPillage{
                function emptyBankAccount();
                function burnDocuments();
            }

            // class implement interface
            // if a class implement a interface, it must implement all method in that interface
            // a class can implement multi interface
            // class Employee implements IEmployee, IDeveloper, iPillage
            class Executive extends Employee implements IPillage{
                private $totalStockOptions;
                function emptyBankAccount(){
                    echo "Call CFO and ask to transfer funds to Swiss bank account.";
                }
                function burnDocuments(){
                    echo "Torch the office suite.";
                }
            }
        ?>
    </body>
</html>
