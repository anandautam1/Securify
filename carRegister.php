<?php

// maybe get user id first then they can assign a new value of the car 
if(!empty($_GET["userID"]) && !empty($_GET["carName"]) && !empty($_GET["description"]) && !empty($_GET["timeStampLastServiced"]) && !empty($_GET["keyID"]) && !empty($_GET["password"]))
	{
		// to register we need the userID as well from the login 
    	// get userID 
    	// check if userID is valid or not 

    	// car ID will be automated 
    	// AUTO INCREMENTAL 
    	// key ID will be unique in the field
		$keyID = random_password(10);
		// register ID will also be randomized 
		$registerID = random_password(10);
		
		$carName = $_GET["carName"];
		$email = $_GET["email"];
		// ROLE has to be a manager 
		$role = $_GET["role"];
		
		$timeStampLastServiced = $_GET["timeStampLastServiced"];

		$description = $_GET["description"];
		
	    $query = "insert into users (userID, fname, lname, email, phone, pass_hashed, pass_salt, Role) values (NULL, '$firstName' , '$lastName', '$email', '$phoneNumber', '$password', '$psalt', '$role')";
	    //echo $query;

	    // method 

	    /*
	    INSERT INTO `securify`.`registercar` (`userID`, `carID`, `keyID`, `registerID`, `name`, `time_stamp_last_serviced`, `description`) VALUES ('1', NULL, 'asdfghjkl', 'asdfgjkla', 'MarryJane', CURRENT_TIMESTAMP, 'Automate Description with the database 
		   Owner: firstname lastname 
		   Phone NUmber: 0415109281
			Last Updated: timestamp ');
		*/

	    $inserted = mysqli_query($con, $query);

	   if($inserted == 1){
	    $json['success'] = 1;
	   }
	   else{
	    $json['success'] = 0;
	   }
	   echo json_encode($json);

	   mysqli_close($con);
	}

	function random_password( $length = 7 ) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-=+;:,.?";
    $password = substr( str_shuffle( $chars ), 0, $length );
    return $password;
	}
?>