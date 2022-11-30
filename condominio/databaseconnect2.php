<?php
$servername = "192.168.10.216";
$database = "condominio";
$username = "lorhan";
$password = "";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";


?>


    
