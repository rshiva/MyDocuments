<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            //The continue statement causes execution of the current loop iteration to end and
            //commence at the beginning of the next iteration.
            $usernames = array("grace","doris","gary","nate","missing","tom");
            for ($x=0; $x < count($usernames); $x++) {
                if ($usernames[$x] == "missing") continue;
                printf("Staff member: %s <br />", $usernames[$x]);
            }
            /*
             * Staff member: grace
             * Staff member: doris
             * Staff member: gary
             * Staff member: nate
             * Staff member: tom
             */
        ?>
    </body>
</html>
