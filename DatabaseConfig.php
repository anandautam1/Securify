<?php

//Define your host here.
$HostName = "127.0.0.1";

//Define your database username here.
$HostUser = "root";

//Define your database password here.
$HostPass = "root";

//Define your database name here.
$DatabaseName = "securify";

	$con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);
	
	if (mysqli_connect_errno($con)) {
     		die("Failed to connect to MySQL: " . mysqli_connect_error());
    }

?>
