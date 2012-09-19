<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<?php
$xml = simplexml_load_file("book.xml");
$authors = $xml->xpath("/library/book/author");
foreach($authors AS $author) {
    echo "$author<br />";
}
// Jane Austen
// Alberto Moravia
// Ernest Hemingway

$book = $xml->xpath("/library/book[author='Ernest Hemingway']");
echo $book[0]->title;
// The Sun Also Rises 
?>
<body>
</body>
</html>
