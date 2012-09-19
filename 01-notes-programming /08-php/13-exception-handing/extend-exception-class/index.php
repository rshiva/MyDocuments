<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // content in error file
            // 1,Could not connect to the database!
            // 2,Incorrect password. Please try again.
            // 3,Username not found.
            // 4,You do not possess adequate privileges to execute this command.

            class My_Exception extends Exception {
                function __construct($language,$errorcode) {
                    $this->language = $language;
                    $this->errorcode = $errorcode;
                }

                function getMessageMap() {
                // open file to get error content
                $errors = file("errors/".$this->language.".txt");
                foreach($errors as $error) {
                    //convert string content to list
                    list($key,$value) = explode(",",$error,2);
                    // push the value to array
                    $errorArray[$key] = $value;
                }
                    // return value from array according to error number
                    return $errorArray[$this->errorcode];
                }
            } # end My_Exception

            try {
                throw new My_Exception("english",4);
            }
            catch (My_Exception $e) {
                echo $e->getMessageMap();
            }
        ?>
    </body>
</html>
