<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
    // Establish a port 80 connection with www.example.com
    $http = fsockopen("www.redant.com.au",80);

    // Send a request to the server
    $req = "GET / HTTP/1.1\r\n";
    $req .= "Host: www.redant.com.au\r\n";
    $req .= "Connection: Close\r\n\r\n";
    
    fputs($http, $req);

    // Output the request results
    while(!feof($http)) {
    echo fgets($http, 1024);
    }
    
    // Close the connection
    fclose($http);
?>
<body>
</body>
</html>
