<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
session_start();
$sid = session_id();

// Encoded data retrieved from database looks like this:
$_SESSION['username'] = "jason";
$_SESSION['loggedon'] = date("M d Y H:i:s");

// Encode all session data into a single string and return the result
$sessionVars = session_encode();
echo $sessionVars;
// username|s:5:"jason";loggedon|s:20:"Oct 10 2010 19:51:28"

// decode session data
session_decode($sessionVars);
echo "User ".$_SESSION['username']." logged on at ".$_SESSION['loggedon'].".";
// User jason logged on at Oct 10 2010 19:51:28. 
?>
<body>
</body>
</html>
