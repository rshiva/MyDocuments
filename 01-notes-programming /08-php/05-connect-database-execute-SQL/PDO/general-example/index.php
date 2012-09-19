<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<body>

<?php

// code should be in sperate file to be included by all pages
// --------------------------------------------------------------------------------------------------
// create database connection
try {
    // specific database name if exist
    $dbh = new PDO("mysql:host=localhost;dbname=student_record", "root", "root");
    // $dbh = new PDO("mysql:host=localhost", "root", "root");
} catch (PDOException $exception) {
    echo "Connection error: " . $exception->getMessage();
}
// --------------------------------------------------------------------------------------------------

// if the database doesn't exist, using following code to create
/*
// create a database
$dbh->exec("CREATE DATABASE `student_record");

// create table
$dbh->exec("CREATE TABLE `student_record`.`detail` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` TEXT NOT NULL ,
`email` TEXT NULL
) ENGINE = InnoDB;");

// insert some record
$dbh->exec("INSERT INTO `student_record`.`detail` (
`id` ,
`name` ,
`email`
)
VALUES (
NULL , 'student1', 'email@1'
), (
NULL , 'student2', 'email@2'
);");
*/

// select data from database
$stmt = $dbh->query("SELECT *
FROM `detail`
LIMIT 0 , 30");

// retrive data
$rows = $stmt->fetchAll();
foreach ($rows as $row) {
    $name = $row['name'];
    $email = $row['email'];
    printf("Product: %s (%s) <br />", $name, $email);
}
?>
</body>
</html>
