<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
    getmxrr("www.redant.com.au",$mxhosts);
    print_r($mxhosts);
    // Array ( [0] => alt1.aspmx.google.com [1] => alt2.aspmx.google.com [2] => aspmx3.googlemail.com [3] => aspmx2.googlemail.com [4] => aspmx.l.google.com )
?>
<body>
</body>
</html>
