<?php
    include("database.php");



    // Get item ID and quantity from POST data
    $itemId = $_POST['itemId'];
    $quantity = $_POST['quantity'];

    // Update quantity in database
    $query = "UPDATE cart_item SET quantity = $quantity WHERE id = $itemId";
    mysqli_query($conn, $query);

    // Close MySQL connection
    mysqli_close($conn);
?>