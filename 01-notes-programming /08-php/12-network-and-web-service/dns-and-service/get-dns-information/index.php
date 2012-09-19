<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
    $result = dns_get_record("www.roamingronin.com");
    print_r($result);
    /*
    Array (
     * [0] => Array
     * (
     * [host] => www.roamingronin.com
     * [type] => CNAME
     * [target] => wine2-web-g33.xincache.cn
     * [class] => IN [ttl] => 3485
     * )
     * [1] => Array
     * (
     * [host] => wine2-web-g33.xincache.cn
     * [type] => A
     * [ip] => 58.30.237.232
     * [class] =>
     * IN [ttl] => 3600
     * )
     * )
     */
?>
<body>
</body>
</html>
