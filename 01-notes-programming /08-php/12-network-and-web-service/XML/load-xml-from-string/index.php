<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
$string = <<<XML
<?xml version='1.0'?>
<document>
 <title>Forty What?</title>
 <from>Joe</from>
 <to>Jane</to>
 <body>
  I know that's the answer -- but what's the question?
 </body>
</document>
XML;

$xml = simplexml_load_string($string);

var_dump($xml);
// object(SimpleXMLElement)#1 (4) { ["title"]=>  string(11) "Forty What?" ["from"]=>  string(3) "Joe" ["to"]=>  string(4) "Jane" ["body"]=>  string(57) " I know that's the answer -- but what's the question? " } 
?>
<body>
</body>
</html>
