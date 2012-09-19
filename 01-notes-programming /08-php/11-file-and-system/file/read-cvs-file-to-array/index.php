<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
           // Read the file into an array
            $users = file("test.csv");
            foreach ($users as $user) {
                // Break each line of the file into three parts
                list($name, $email, $phone) = explode(",", $user);
                // Output the data in HTML format
                printf("<p>%s (%s) Tel. %s</p>", $name, $email, $phone);
            }

            //<p>Jason Gilmore (jason@example.com) Tel. 614-555-1234</p>
            //<p>Bob Newhart (bob@example.com) Tel. 510-555-9999</p>
            //<p>Carlene Ribhurt (carlene@example.com) Tel. 216-555-0987</p>
        ?>
    </body>
</html>
