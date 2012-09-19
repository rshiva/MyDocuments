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


            // Read the file into a string variable
            $userfile= file_get_contents("user.txt");
            // print ("$userfile");
            // Ale ale@example.com Nicole nicole@example.com Laura laura@example.com
            
            // Place each line of $userfile into array
            $users = explode("\n",$userfile);
            
            // Cycle through the array
            foreach ($users as $user) {
                // Parse the line, retrieving the name and e-mail address
                list($name, $email) = explode(" ", $user);
                // Output the formatted name and e-mail address
                echo "<a href=\"mailto:$email\">$name/a> <br />";
            }
            //<a href="mailto:ale@example.com">Ale/a> <br />
            //<a href="mailto:nicole@example.com">Nicole/a> <br />
            //<a href="mailto:laura@example.com">Laura/a> <br />
        ?>
    </body>
</html>
