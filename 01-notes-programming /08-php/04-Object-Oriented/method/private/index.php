<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Visitors{
                // Methods marked as private are available for use only within the originating class and
                // cannot be called by the instantiated object, nor by any of the originating class’s subclasses.
                private function validateCardNumber($number){
                    if (! ereg('^([0-9]{4})-([0-9]{3})-([0-9]{2})') ) return FALSE;
                    else return TRUE;
                }
            }
        ?>
    </body>
</html>
