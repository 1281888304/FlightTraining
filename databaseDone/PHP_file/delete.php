<?php

include 'conn.php';

$id=$_POST['id'];
$connect->query("DELETE FROM test1 WHERE id=".$id);


?>