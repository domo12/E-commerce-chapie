<?php
    include_once 'includes/navbar.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
    <link rel="stylesheet" href="shopping.css">
    <title></title>
</head>
<body>

    <?php 
        include('database.php'); 
    ?>

    <section style="padding-top: 10rem;">
        <?php 
            $sql = "SELECT * FROM product";
            
            if(isset($_GET["id"])){
                $catID = $_GET['id'];
                $sql .= " WHERE id = '$catID'";
            }

            $result = mysqli_query($conn, $sql);    

            if (mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_assoc($result);
                echo '
                    <div class="container my-5">
                        <div class="row">
                            <div class="col-md-6">
                                <img src="'.$row['image_directory'].'" class="img-fluid">
                            </div>
                        <div class="col-md-6">
                            <h2>'.$row['name'].'</h2>
                            <p class="lead">RM '.$row['price'].'</p>
                            <p class="font-weight-bold">Description</p>
                            <p>'.$row['description'].'</p>
                            
                            <form method="post" action="product_detail.php">
                                <input type="hidden" name="product_id" value="'.$row['id'].'">
                                <input type="hidden" name="product_name" value="'.$row['name'].'">
                                <input type="hidden" name="product_price" value="'.$row['price'].'">
                                <button type="submit" class="add_to_cart btn btn-primary" name="btnCart" value="btnCart">Add to Cart</button>
                            </form>
                        </div>
                        </div>
                    </div>                 
            ';
            }
            
        ?>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="shopping.js"></script>

    <?php 

        if(isset($_POST['btnCart'])){
            if(isset($_SESSION['email'])){
                // Retrieve the product data from the form
                $product_id = $_POST['product_id'];
                $customerEmail = $_SESSION['email'];
                $quantity = 1;

                $sql = "INSERT INTO cart_item (`product_id`, `customer_id`, `quantity`) VALUES ('$product_id', (SELECT user_id FROM customer WHERE email = '$customerEmail'), '$quantity')";

                $result = mysqli_query($conn, $sql);
            
                if($result){
                    echo '
                        <script>alert("Product added to cart successfully!");
                            window.location.href="products_list.php";
                        </script>';
                } else{
                    echo "Error: " . $sql . "<br>" . mysqli_error($conn);

                    echo '
                        <script>
                            alert("Failed to add product to cart!" );
                            window.location.href="products_list.php";
                        </script>';
                }
            }else{
                echo '<script>
                    window.location.href = "login.php";    
                </script>';
            }  
        }   
    ?>

</body>
</html>