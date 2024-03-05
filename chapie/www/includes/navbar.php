<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    *{
        padding: 0;
        margin: 0;
    }

    ul{
        list-style: none;
    }

    ul li{
        display: inline-block;
        position: relative;
    }

    ul li a{
        display: block;
        padding: 20px 25px;
        text-decoration: none;
        text-align: center;
        font-size: 15px;
    }

    ul li ul.dropdown li{
        display: block;
    }

    ul li ul.dropdown{
        box-shadow: 0 0 20px 0 #7f7f7f3d;

        width: 200%;
        position: absolute;
        z-index: 999;
        display: none;
        background: white;
    }

    
    ul li a:hover{
        background: white;
    }

    ul li:hover ul.dropdown{
        display: block;
    }


</style>
<?php
session_start();
?>

<!--- navbar --->
<nav class = "navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
    <div class = "container">
        <a class = "navbar-brand d-flex justify-content-between align-items-center order-lg-0" href = "home.php">
            <div class="col">
                <img src = "icon/logo.png" width="30" height="30" class="d-inline-block align-top" alt="logo">
            </div>    
            <div class="col">
                <span class = "text-uppercase fw-lighter ms-2" >ChaPie</span>
            </div>            
        </a>

        <button class = "navbar-toggler border-0" type = "button" data-bs-toggle = "collapse" data-bs-target = "#navMenu">
            <span class = "navbar-toggler-icon"></span>
        </button>

        <div class = "collapse navbar-collapse order-lg-1" id = "navMenu">
            <ul class = "navbar-nav mx-auto text-center">
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "home.php">home</a>
                </li>
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "products_list.php">All product</a>
                </li>

                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "home.php#category">Category</a>
                    <ul class="dropdown">
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=1">Food</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=2">Mobiles and Accessories</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=3">Health & Beauty</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=4">Baby & Toys</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=5">Men Cloth</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=6">Women Cloth</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=7">Home Appliances</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=8">Women Shoe</a></li>                           
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=9">Sport & Outdoor</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=10">Automotive</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=11">Bads</a></li>
                        <li><a class = "nav-link text-uppercase text-dark" href="products_list.php?category=12">Men Shoe</a></li>
                    </ul>
                </li>

                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark"  href = "home.php#aboutUs">About us</a>
                </li>

                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "contactUs.php">Contact Us</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control mr-sm-2" type="text" id="search-input" placeholder="Search...">
                <button class="btn btn-outline-success ms-1 my-2 my-sm-0" onclick="search_Btn()" type="submit">Search</button>
            </form>
            <ul class = "navbar-nav mx-auto text-center">
                <div class = "order-lg-2 nav-btns">
                    <button type = "button" class = "btn btn-lg position-relative" onclick="window.location.href='cart.php'">
                        <i class = "fa fa-shopping-cart" ></i>
                    </button>
                </div>
            </ul>

            <?php 

                if(isset($_SESSION['email'])){
                    $email = $_SESSION['email'];

                    echo '<ul class = "navbar-nav mx-auto text-center">
                            <div class = "order-lg-2 nav-btns">
                                <p style="display:inline">Welcome '.$email.',</p>
                                <a href="logout.php">Logout</a>
                            </div>
                        </ul>';  

                }else{
                    echo '<ul class = "navbar-nav mx-auto text-center">
                            <div class = "order-lg-2 nav-btns">
                                <a href="index.php">Login</a>
                            </div>
                        </ul>'; 
                }
            ?>

        </div>
    </div>
</nav>
