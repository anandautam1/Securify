<?php

include 'DatabaseConfig.php';

// Create connection
$conn = new mysqli($HostName, $HostUser, $HostPass, $DatabaseName);
 
 if($_SERVER['REQUEST_METHOD'] == 'POST')
 {
 $DefaultId = 0;
 
 $ImageData = $_POST['image_path'];
 
 $ImageName = $_POST['image_name'];

 $GetOldIdSQL ="SELECT CarID FROM ImageToServerTable ORDER BY CarId ASC";
 
 $Query = mysqli_query($conn,$GetOldIdSQL);
 
 while($row = mysqli_fetch_array($Query)){
 $DefaultId = $row['carID'];
 }
 
 $ImagePath = "images/$DefaultId.png";
 
 $ServerURL = "https://androidjsonblog.000webhostapp.com/$ImagePath";
 
 $InsertSQL = "insert into ImageToServerTable (image_path,image_name) values ('$ServerURL','$ImageName')";
 


 if(mysqli_query($conn, $InsertSQL)){

 file_put_contents($ImagePath,base64_decode($ImageData));

 $json_psalt['success'] = 1;
 $json_psalt['message'] = "Your Image Has Been Uploaded.";
 echo json_encode($json);
 }
 else{
 $json_psalt['success'] = 0;
 $json_psalt['message'] = "Image Upload Failed";
 echo json_encode($json);
 }
 mysqli_close($conn);

?>