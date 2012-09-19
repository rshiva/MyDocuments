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
// if the database exist, specific database when create connection
$mysqli = new mysqli("localhost", "root", "root", "student_record");
// $mysqli = new mysqli("localhost", "root", "root");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
// --------------------------------------------------------------------------------------------------

// if the database doesn't exist, using following code to create
/*
// create a database
$mysqli->query("CREATE DATABASE `student_record");

// create table
$mysqli->query("CREATE TABLE `student_record`.`detail` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` TEXT NOT NULL ,
`email` TEXT NULL
) ENGINE = InnoDB;");

// insert some record
$mysqli->query("INSERT INTO `student_record`.`detail` (
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
$result = $mysqli->query("SELECT *
FROM `detail`
LIMIT 0 , 30");

// retrive data with associate array
while ($row = $result->fetch_array(MYSQLI_ASSOC))
{
    $name = $row['name'];
    $email = $row['email'];
    echo "Product: $name ($email) <br />";
}

// release memory
$result->free();

// close database connection
$mysqli->close();
?>
</body>
</html>
