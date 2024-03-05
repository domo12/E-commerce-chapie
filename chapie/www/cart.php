>
<?php
    include_once 'includes/navbar.php';
    //session_start();
    if(!isset($_SESSION['email'])){
        header("Location: logout.php");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="cart\style.css">

    <title>Cha Pie | Cart</title>
    <style>
        /* CSS */
        .button-1 {
        background-color: #ff523b;
        border-radius: 8px;
        border-style: none;
        box-sizing: border-box;
        color: #FFFFFF;
        cursor: pointer;
        display: inline-block;
        font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 14px;
        font-weight: 500;
        height: 40px;
        line-height: 20px;
        list-style: none;
        margin: 0;
        outline: none;
        padding: 10px 16px;
        position: relative;
        text-align: center;
        text-decoration: none;
        transition: color 100ms;
        vertical-align: baseline;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        }

        .button-1:hover,
        .button-1:focus {
        background-color: #ff523b;
        }

    </style>
</head>

<body>

    <!--- Navbar --->
    <?php 
        include('database.php');
    ?>

    <section style="padding-top: 120px; padding-right: 100px;">
        <div class="container">
            <?php 
            if(isset($_SESSION['email'])){
                $useremail = $_SESSION['email'];

                $sql = "SELECT p.*, ci.id as cart_id, SUM(ci.quantity) AS total_quantity
                FROM product p
                INNER JOIN cart_item ci ON p.id = ci.product_id
                INNER JOIN customer c ON c.user_id = ci.customer_id
                WHERE c.email = ?
                GROUP BY p.id";
                
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $useremail);
                $stmt->execute();
                $result = $stmt->get_result();
                                
                if(mysqli_num_rows($result) > 0){
                    echo " 
                    <div>
                        <table>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>     
                            </tr>           
                    ";

                    $totalPrice = 0;

                    while($row = $result->fetch_assoc()){
                        
                        $pname = wordwrap($row['name'],80,"<br>\n"); 


                        $subtotal = $row['price'] * $row['total_quantity'];
                        
                        echo '
                        <tr >
                            <td>
                                <div class="cart-info" style="display:flex; flex-wrap:wrap;">
                                    <img src="'.$row['image_directory'].'" alt="This is a image">
                                    <div>
                                        <p id="item-name">'.$pname.'</p>
                                        <small class="item-price" value="'.$row['price'].'" data-item-id="'.$row['cart_id'].'">Price: '.$row['price'].'</small>
                                        <br>
                                        <button class="qty-btn remove-btn" id="remove-btn" data-item-id="'.$row['cart_id'].'" style="border:none;">remove</button>
                                        </div>
                                </div>                   
                            </td>
                            <td>
                                <button class="qty-btn minus-btn" data-item-id="'.$row['cart_id'].'" style="border:none; height:30px">
                                    <i class = "fa fa-solid fa-minus" ></i>
                                </button>
                                <input type="number" class="qty-input" value="'.$row['total_quantity'].'" data-item-id="'.$row['cart_id'].'" disabled>
                                <button class="qty-btn plus-btn" data-item-id="'.$row['cart_id'].'" style="border:none; height:30px">
                                <i class = "fa fa-solid fa-plus" ></i>

                                </button>
                            </td>
                            <td class="item-subtotal-price" data-item-id="'.$row['cart_id'].'" > RM '.$subtotal.'</td>   
                        </tr>
                            ';

                        $totalPrice += round((Double)$subtotal, 2); 
                    }

                    echo '
                        </table>            
                    </div>'; ?>

                    <div class ="total-price">
                        <table>
                            <tr>
                                <td>Total</td>
                                <td class="total-price" id="total-price">RM <?php echo number_format($totalPrice, 2); ?></td>
                            </tr>
                        
                        </table>                    
                    </div>
                    
                    <?php

                        echo'
                        
                            <div class = "container" style="padding-top: 40px;">
                                <h4>Payment Details</h4>
                                <form action="cart.php" method="POST" style="padding:5px;">                      
                                    <br><br>
                                    <h6>User Information</h6>
                                    <label for="address">Home Address: </label>
                                    <input type="text" id="address" name="address" class="input-field" placeholder="address" style="font-family: sans-serif; padding:5px; border-radius: 4px;  border: 1px solid #ccc;"" size="100" required> <br>

                                    <br><br>
                                    <h6>Payment Option</h6>
                                    <input type="radio" id="cod" name="cod" value="cod" required>
                                    <label for="cod">Cash On Delivery(COD)</label><br>
                                    
                                    <input type="radio" id="credit-card" name="credit-card" value="credit-card" disabled>
                                    <label for="credit-card">Credit cart</label><br>

                                    <input type="radio" id="apple-pay" name="apple-pay" value="apple-pay" disabled>
                                    <label for="apple-pay">Apple Pay</label><br>

                                    <input type="radio" id="credit-installment" name="credit-installment" value="credit-installment" disabled>
                                    <label for="credit-installment">Credit Installment</label><br>

                                    <div class="d-flex flex-row-reverse">
                                        <button type="submit" class="button-1" name="place" style="border:none;">Place Order</button>
                                    </div>  
                                </form>
                            </div> 
                        ';
                }else{
                    echo'
                        <script>
                        alert("No item in the cart list. Go add some now!");
                        window.location.href="products_list.php";
                        </script>

                        ';
                }                
            }

                    
            ?>   
        </div>
    </section>




    <?php
        if(isset($_POST['place'])){
            echo "<script>";
            echo "window.location.href = 'checkout.php'";
            echo "</script>";             
        }
    ?>

    <!--- Javascript resources --->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="shopping.js"></script>
    <script src="cart\index.js"></script>



</body>
</html>
