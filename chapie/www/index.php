<?php
    session_start();
    include('database.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css"  >
    <title>Cha Pie | Login</title>
</head>
<body>
    <div class="hero">
        <div class="form-box">
            <div class="button-box">
                <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="login()">Login</button>
                    <button type="button" class="toggle-btn" onclick="register()">Register</button>                    
            </div>
            <div class="social-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
            </div>
            <form id="login" method="post" action="index.php" class="input-group" >
                <input type="email" id="login-email" name="login-email" class="input-field" placeholder="email" required>

                <input type="password" id="login-password" name="login-password" class="input-field" placeholder="password" required>
                
                <input type="checkbox" class="option" id="check-box"class="option"><span id="register-check-box">Remember Password</span>
                
                <input type="submit" class="submit-btn">
            </form>
            <form id="register" method="post" action="index.php" class="input-group">
                <input type="text" id="username" name="username" class="input-field" placeholder="username" required>
                <input type="email" id="register-email" name="register-email" name="email" class="input-field" placeholder="email" required>
                <input type="password" id="register-password" name="register-password" class="input-field" placeholder="password" required>
                <input type="checkbox"  class="check-box" id="check-box" required><span id="register-check-box">I agree to the terms and conditions</span>
                <button type="submit" class="submit-btn">Register</button>
            </form>
        </div>
    </div>


    <script>
        var x =document.getElementById("login");
        var y =document.getElementById("register");
        var z =document.getElementById("btn");

        function register(){
            x.style.left="-400px";
            y.style.left="50px";
            z.style.left="109px";
         }

         function login(){
            x.style.left="50px";
            y.style.left="450px";
            z.style.left="0px";
         }

        function preventBack(){window.history.forward()};
        setTimeout("preventBack()", 0);
        window.onunload=function(){null;}
            
    </script>
    </script>


    <?php
        if($_SERVER["REQUEST_METHOD"] == "POST"){
            $sql = "SELECT * FROM `customer`";
            $result = mysqli_query($conn, $sql);
            $found = false;
            if(isset($_POST['login-email']) && isset($_POST['login-password'])){
                $email = $_POST['login-email'];
                $password = $_POST['login-password'];
                while($row = mysqli_fetch_assoc($result)){
                    if($row['email'] == $email && $row['password'] == $password){
                        $_SESSION['email'] = $email;
                        $_SESSION['password'] = $password;
                        $_SESSION['is_login'] = '0';

                        echo "<script>";
                        echo "window.location.href = 'home.php'";
                        echo "</script>";
                        break;
                    }
                }
                if($found == false){
                    echo "<script>";
                    echo "javascript:alert('Invalid email or password');";
                    echo "</script>"; 
                }                
            }

            if(isset($_POST['username']) && isset($_POST['register-email']) && isset($_POST['register-password'])){
                $email = $_POST['register-email'];
                $password = $_POST['register-password'];
                $username = $_POST['username'];
                
                $found = false;
                while($row = mysqli_fetch_assoc($result)){
                    if($row['email'] == $email || $row['user_name']==$username){
                        echo "<script>";
                        echo "javascript:alert('Registered email and username');";
                        echo "</script>"; 
                        $found = true;
                        break;
                    }
                }
                if($found == false){
                    $sql = "INSERT INTO `customer`(`user_name`, `email`, `password`) VALUES ('$username', '$email','$password')";
                    if(mysqli_query($conn, $sql)){
                        $_SESSION['email'] = $email;
                        $_SESSION['password'] = $password;
                        $_SESSION['username'] = $username;
                        $_SESSION['is_login'] = '0';
 
                        echo "<script>";
                        echo "window.location.href = 'home.php'";
                        echo "</script>";

                    }else{
                        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
                    }
                }
            }
        }
    ?>  

</body>
</html>