<?php include('includes/navbar.php'); ?>

<!DOCTYPE html>
<html>
    <head>
    <title>Cha Pie | Contact Us</title>

	<style>


	</style>
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="contactUs\style.css">
    </head>

    <body>
	
    <div class="container" style="padding-top:140px;">
		<main class="row">

			<section class="column left">

				<div class="title">
					
					<h2>Contact Us</h2>
					<p>We are love to hear from you</p>
					<p>Please write down your information, we willing to solve any question or problem you response.</p> 
				</div>

				<div class="contact">
					
					<div class="iconGroup">
						<div class="icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="details">
							<span>Phone</span>
							<span>+03-2282-3719</span>
						</div>
					</div>

					<div class="iconGroup">
						<div class="icon">
							<i class="fa fa-envelope"></i>
						</div>
						<div class="details">
							<span>Email</span>
							<span>ChaPieGroup@gmail.com</span>
						</div>
					</div>

					<div class="iconGroup">
						<div class="icon">
							<i class="fa fa-location-arrow"></i>
						</div>
						<div class="details">
							<span>Location</span>
							<span>Six Ceylon<br>
								  6, Jalan Bukit Ceylon,<br>
								  Bukit Bintang, Kuala Lumpur,<br>
								  50200, Malaysia
							</span>
						</div>
					</div>

				</div>


				<div class="social-links">
					<a href="#"><i class="fa fa-facebook-f"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-instagram"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>
				</div>

			</section>

			<section class="column right">

				<form class="infoForm" method="POST">
					
					<div class="inputGroup halfWidth">
						<input type="text" name="cont-name" required="required">
						<label>Name</label>
					</div>

					<div class="inputGroup halfWidth">
						<input type="email" name="cont-email" required="required">
						<label>Email</label>
					</div>

					<div class="inputGroup fullWidth">
						<input type="text" name="cont-subject" required="cont-subject">
						<label>Subject</label>
					</div>

					<div class="inputGroup fullWidth">
						<textarea required="required" name="cont-description"  ></textarea>
						<label>Description</label>
					</div>

					<div class="inputGroup fullWidth">
							<button name="cont-submit-btn" >Submit</button>
							<br><br><br>
					</div>

				</form>
				
			</section>

		</main>
	</div>
    <hr>

	<?php 
        include("includes/footer.php");

		include("database.php");

		if(isset($_POST['cont-submit-btn'])){
			$email = $_POST['cont-email'];
			$name = $_POST['cont-name'];
			$subject = $_POST['cont-subject'];
			$description = $_POST['cont-description'];

			$sql = "INSERT INTO `contact_us`( `subject`, `description`, `customer_name`, `customer_email`) VALUES ('$subject' , '$description' , '$name' , '$email' )";
			
			
			if(mysqli_query($conn, $sql)){
				echo "<script>";
				echo "alert('Thank you for your responde. We will contact you soon');";
				echo "</script>"; 
			}else{
				echo "<script>";
				echo "alert('error');";
				echo "</script>"; 
			}
		}
	
	?>

	


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="shopping.js"></script>
    </body>
</html>