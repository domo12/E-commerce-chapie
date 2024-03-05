

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link  href="style.css" rel="stylesheet">

    <title>Cha Pie | Home</title>
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
</head>
<body> 


    <div id="preloader">

    </div>

    <?php
        include("includes/navbar.php");
    ?>
    <header id = "header" class = "vh-100 carousel slide" data-bs-ride = "carousel" style = "padding-top: 104px;   ">
        <div class = "container h-100 d-flex align-items-center carousel-inner">
            <div class = "text-center carousel-item active">
                <h2 class = "text-capitalize text-white">best collection</h2>
                <h1 class = "text-uppercase py-2 fw-bold text-white">new arrivals</h1>
                <a href = "products_list.php" class = "btn mt-3 text-uppercase">shop now</a>
            </div>
            <div class = "text-center carousel-item">
                <h2 class = "text-capitalize text-white">best price & offer</h2>
                <h1 class = "text-uppercase py-2 fw-bold text-white">new season</h1>
                <a href = "products_list.php" class = "btn mt-3 text-uppercase">shop now</a>
            </div>
        </div>

        <button class = "carousel-control-prev" type = "button" data-bs-target="#header" data-bs-slide = "prev">
            <span class = "carousel-control-prev-icon"></span>
        </button>
        <button class = "carousel-control-next" type = "button" data-bs-target="#header" data-bs-slide = "next">
            <span class = "carousel-control-next-icon"></span>
        </button>
    </header>

    <?php 
        include("database.php");
        $category_sql = "SELECT * FROM category";
        $category_result = mysqli_query($conn, $category_sql);
    ?>
    
    <section id="category">
    <div class="cat_container">
        <?php 
            if (mysqli_num_rows($category_result) > 0) {
                $count = 0;
                while($row = mysqli_fetch_assoc($category_result)) {
                    if($count % 6 == 0){
                        echo '
                            <div class="row row-cols-1 row-cols-md-6">';
                    }
                    echo '
                        <div class="card" name="'.$row['id'].'">
                            <div class="card-body">
                                <img src="'.$row['category_image_directory'].'" width="30" height="30" class="d-inline-block align-top mx-auto d-block">
                                <a class = "nav-link text-uppercase text-dark text-center stretched-link" href="products_list.php?category='.$row["id"].'">'.$row['name'].'</a>
                            </div>
                        </div>';
                    $count++;

                    if($count % 6 == 0){
                        echo '
                            </div>
                        ';
                    }
                }
            }
        ?>   
    </div>
    </section> 
    
    <section id="aboutUs">
        <?php
            include('aboutUs\aboutUs.php');
        ?>        
    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="shopping.js"></script>

    <?php
		include("includes/footer.php");
	?>

    <script>
        var loader = document.getElementById("preloader");

        window.addEventListener("load", function(){
            loader.style.display = "none";
        })
    </script>
</body>
            
</html>