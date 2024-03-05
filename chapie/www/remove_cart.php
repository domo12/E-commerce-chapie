<?php
    include("database.php");

    // Get item ID and quantity from POST data
    $itemId = $_POST['itemId'];

    // Update quantity in database
    $query = "DELETE FROM `cart_item` WHERE id = $itemId";
    mysqli_query($conn, $query);

    // Close MySQL connection
    mysqli_close($conn);
?>