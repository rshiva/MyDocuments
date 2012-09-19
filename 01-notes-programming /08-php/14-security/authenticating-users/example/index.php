<?php
    function authenticate_user() {
        header('WWW-Authenticate: Basic realm="Secret Stash"');
        // require pop up
        header("HTTP/1.0 401 Unauthorized");
        exit;
    }

    // if not enter user will call pop up
    if(! isset($_SERVER['PHP_AUTH_USER'])) {
        authenticate_user();
    } else {
        // connect to database
        mysql_connect("localhost","authenticator","secret") or die("Can't connect to database server!");
        mysql_select_db("corporate") or die("Can't select authentication database!");

        // check in database to see if user name, password and ip is match
        $query = "SELECT username, pswd FROM logins WHERE username='$_SERVER[PHP_AUTH_USER] AND pswd=MD5('$_SERVER[PHP_AUTH_PW]') AND ip='$_SERVER[REMOTE_ADDR]'";
        $result = mysql_query($query);
        if (mysql_num_rows($result) == 0)
            authenticate_user();
        else
        echo "Welcome to the secret archive!";
        mysql_close();
    } # end if
?>
