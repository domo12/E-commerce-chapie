<link href="style.css" rel="stylesheet">

<?php
    include("database.php");

    $product_sql = "SELECT * FROM product";

    $sortby = $_GET["sortby"];

    if(isset($_GET["category"])){
        $catID = $_GET['category'];
        $product_sql .= " WHERE category_id = '$catID'";
    }

    if(isset($_GET['search'])){
        $serach = $_GET['search'];
        $product_sql .= " WHERE name LIKE '%$serach%'";
    }

    $product_sql .= " ORDER BY $sortby ASC";

    $result = mysqli_query($conn, $product_sql);    
    
    if (mysqli_num_rows($result) > 0) {
        $count = 0;
        while($row = mysqli_fetch_assoc($result)) {
            if($count % 4 == 0){
                echo '<div class="row row-cols-1 row-cols-md-4 gx-5" id="product-list">';
            }
            echo '<div class="col gy-5">
                      <div id="product_details" class="card h-100" style="border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)";>
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
                echo '</div>';
            }
        }                    
    }else{
        echo '<div class="container">
        <img src="icon\noResult.png" class="d-inline-block align-top mx-auto d-block" width="150" height="150" style="margin-top:1rem;" alt="image">
        <p class="text-center fs-5">No results found</p>
        <p class="text-center fs-6">Try different or more general keywords</p>
    </div>';
    }       
?>              
