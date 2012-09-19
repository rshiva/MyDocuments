<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // content in txt
            // Ale ale@example.com
            // Nicole nicole@example.com
            // Laura laura@example.com


            // Read the file into an array
            $users = file("user.txt");

            // print_r($users);
            // Array ( [0] => Ale ale@example.com [1] => Nicole nicole@example.com [2] => Laura laura@example.com ) 

            // Cycle through the array
            foreach ($users as $user) {
                // Parse the line, retrieving the name and e-mail address
                list($name, $email) = explode(" ", $user);
                // Remove newline from $email
                $email = trim($email);

                // Output the formatted name and e-mail address
                echo "$name/$email<br /> ";
            }

            // Ale/ale@example.com
            // Nicole/nicole@example.com
            // Laura/laura@example.com
        ?>
    </body>
</html>
