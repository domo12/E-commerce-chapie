<?php 
    include_once 'includes/navbar.php';

    include('database.php');    

    $limit = 32;

    if(isset($_GET["category"]) || isset($_GET['search'])){
        $limit = 1000;
    }

    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $start = ($page - 1) * $limit;
                
    $product_sql = "SELECT * FROM product LIMIT $start, $limit";
    $result1 = mysqli_query($conn, "SELECT count(id) AS id FROM product ");

    if(isset($_GET["category"])){
        $catID = $_GET['category'];
        $product_sql = "SELECT * FROM product WHERE category_id = '$catID' LIMIT $start, $limit";
    }

    if(isset($_GET['search'])){
        $serach = $_GET['search'];
        $product_sql = "SELECT * FROM product WHERE name LIKE '%$serach%' LIMIT $start, $limit";
    }



    $productCount = $result1->fetch_all(MYSQLI_ASSOC);
    $total = $productCount[0]['id'];
    $pages = ceil( $total / $limit);
    
    if($Previous != 0){
        $Previous = $page - 1;
    }else{
        $Previous = 1;
    }

    if($Next != $pages){
        $Next = $page + 1;
    }else{
        $Next = $page;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="font-awesome-4.7.0\css\font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <style>
        #preloader{
            background: white url(icon/preloader.gif) no-repeat center center;
            background-size: 15%;
            height: 100vh;
            width: 100%;
            position: fixed;
            z-index: 100;
        }
    </style>
    <title>ChaPie</title>
</head>
<body>
    <div id="preloader">
    </div>

    <section id="sort" style="padding-top: 10rem;" >
        <div class="container">
            <p>sort by: </p>
            <option type="button" class="btn btn-light" id="namebtn">Name</button>
            <option type="button" class="btn btn-light" id="pricebtn">price</button>            
        </div>
    </section>
    
    <section style="padding-top: 5rem; padding-bottom: 5rem;">
        <div class="container" id="product-list-container">

            <?php
                $result = mysqli_query($conn, $product_sql);   

                if (mysqli_num_rows($result) > 0) {
                    $count = 0;
                    while($row = mysqli_fetch_assoc($result)) {
                        if($count % 4 == 0){
                            echo '
                            <div class="row row-cols-1 row-cols-md-4 gx-5" id="product-list">';
                        }
                            echo '
                                        <div class="col gy-5" >
                                            <div id="product_details" class="card h-100" style="border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                                                <img src="'.$row['image_directory'].'" class="d-inline-block align-top mx-auto d-block" width="150" height="150" style="margin-top:1rem;" alt="image">
                                                <div class="card-body">
                                                    <p class="card-title text-uppercase text-dark" href="#">'.$row['name'].'</p>
                                                    <p class="card-title text-uppercase text-dark" href="#">RM '.$row['price'].'</p>
                                                    <a class="stretched-link" href="product_detail.php?id='.$row["id"].'"></a>
                                                </div>                                
                                            </div>
                                        </div>';
                            $count++;
                                
                            if($count % 4 == 0){
                                echo '
                                    </div>
                                ';
                            }
                        }                    
                }else{
                    echo'
                    <div class="container">
                        <img src="icon\noResult.png" class="d-inline-block align-top mx-auto d-block" width="150" height="150" style="margin-top:1rem;" alt="image">
                        <p class="text-center fs-5">No results found</p>
                        <p class="text-center fs-6">Try different or more general keywords</p>
                    </div>';
                }       
            ?>              
        </div>
          
    </section>    
    
    <?php 
        if(!(isset($_GET["category"]) || isset($_GET['search']))){
            echo '
            <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center" style="padding-top: 20px;">
                <li class="page-item"> 
                <a class="page-link"  href="products_list.php?page='.$Previous.'" aria-label="Previous">
                        <span aria-hidden="true">&laquo; Previous</span>
                    </a>
                </li>';
                 for($i = 1; $i<= $pages; $i++){
                    echo'<li class="page-item"><a class="page-link"href="products_list.php?page='.$i.'"> '.$i.'</a></li>';
                 };
                   echo' <li>
                        <a class="page-link"  href="products_list.php?page='.$Next.'" aria-label="Next">
                            <span aria-hidden="true">Next &raquo;</span>
                        </a>
                    </li>
            </ul>
        </nav>';            
            

        }    
    ?>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="shopping.js"></script>

    <script>

        var namebtn = document.getElementById("namebtn");
        var pricebtn = document.getElementById("pricebtn");

        namebtn.addEventListener("click", function() {
            sortProducts("name");
        });

        pricebtn.addEventListener("click", function() {
            sortProducts("price");
        });

        function sortProducts(sortBy) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("product-list-container").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "sort_products.php?sortby=" + sortBy, true);
            xhttp.send();
        }

        var loader = document.getElementById("preloader");

        window.addEventListener("load", function(){
            loader.style.display = "none";
        })
    </script>

</body>
</html>