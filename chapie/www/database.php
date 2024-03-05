<?php
    $conn = mysqli_connect('localhost','root' ,'','chapie', '3308') or die();

    if ($conn->connect_error) {
        die('Error : ('. $conn->connect_errno .') '. $conn->connect_error);
    }
?>