<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!--
        There are two common methods for passing data from one script to another: GET and POST.
        post can handle more information than get
         -->
        
         <form action="<?php echo $_SERVER['PHP_SELF']; // posting data back to the same script from using super global $_SERVER['PHP_SELF'] ?>" method="post">
            <p>
                Name:<br />
                <input type="text" id="name" name="name" size="20" maxlength="40" />
            </p>
            <p>
                Email Address:<br />
                <!-- name="" refer $_POST[] -->
                <input type="text" id="email1" name="email" size="20" maxlength="40" />
            </p>
            <input type="submit" id="submit" name = "submit" value="Go!" />
        </form>

        <?php
            // // If the name field is filled in
            if (isset($_POST['name'])){
                // get data from form
                // htmlentities to filter user input for secure
                $name = htmlentities($_POST['name']);
                $email = htmlentities($_POST['email']);

                printf("Hi %s! <br />", $name);
                printf("The address %s will soon be a spam-magnet! <br />", $email);
            }
        ?>
    </body>
</html>
