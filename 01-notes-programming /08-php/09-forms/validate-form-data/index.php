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
           // Function used to check e-mail syntax
            function validateEmail($email)
            {
                // Create the e-mail validation regular expression
                $regexp = "^([_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-z0-9-]+)*(\.[a-z]{2,6})$";
                // Validate the syntax
                if (eregi($regexp, $email))return 1;
                else return 0;
            }

            // Has the form been submitted?
            if (isset($_POST['submit']))
            {
                $name = htmlentities($_POST['name']);
                $email = htmlentities($_POST['email']);
                printf("Hi %s<br />", $name);

                if (validateEmail($email))
                    printf("The address %s is valid!", $email);
                else
                    printf("The address <strong>%s</strong> is invalid!", $email);
            }
        ?>
    </body>
</html>
