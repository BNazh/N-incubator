<?php
$dbc = mysqli_connect('localhost', 'root', '', 'lesson') OR DIE('Ошибка подключения к базе данных');
if(isset($_POST['submit'])){
	$username = mysqli_real_escape_string($dbc, trim($_POST['username']));
	$password1 = mysqli_real_escape_string($dbc, trim($_POST['password1']));
	$password2 = mysqli_real_escape_string($dbc, trim($_POST['password2']));
	if(!empty($username) && !empty($password1) && !empty($password2) && ($password1 == $password2)) {
		$query = "SELECT * FROM `signup` WHERE username = '$username'";
		$data = mysqli_query($dbc, $query);
		if(mysqli_num_rows($data) == 0) {
			$query ="INSERT INTO `signup` (username, password) VALUES ('$username', '$password2')";
			mysqli_query($dbc,$query);
			echo 'Всё готово, можете авторизоваться';
			mysqli_close($dbc);
			exit();
		}
		else {
			echo 'Логин уже существует';
		}

	}
}
?>
<!DOCTYPE html>
 <html>
 <head>
 	<title></title>
 	<link rel="stylesheet" type="text/css" href="log.css">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<script src="script.js" defer></script>
 </head>
 <body>
 	<div id="myNav" class="overlay">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
	    <a href="Main.php">Mac</a>
	    <hr>
	    <a href="Main.php">iPad</a>
	    <hr>
	    <a href="Main.php">iPhone</a>
	    <hr>
	    <a href="Main.php">Watch</a>
	    <hr>
	    <a href="Main.php">TV</a>
	    <hr>
	    <a href="Main.php">Music</a>
	    <hr>
	    <a href="Support.php">Support</a>
	    <hr>
	    <div class="qwem2">
				 
				<input placeholder="Search apple.com" style="font-size: 22px;" type="" id="inps" name="">
		</div>
	   	<hr>
	  </div>
	</div>
	<header id="kx">
 		<div id="kn">

 			<span class="menuqw" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
 			<div class="logoimg"><a href="Main.php"><img src="img/a.jpg"></a></div>
 			<div class="menuheader">
 				<ul type="none">
 						<li><a href="Main.php">Mac</a> </li>
 						<li><a href="Main.php">iPad</a> </li>
 						<li><a href="Main.php">iPhone</a> </li>
 						<li><a href="Main.php">Watch</a> </li>
 						<li><a href="Main.php">TV</a> </li>
 						<li><a href="Main.php">Music</a> </li>
 						<li><a href="Support.php">Support</a> </li>

 				</ul>
 			</div>
 			<div class="input"><a href=""><img src="img/c.jpg"></a></div>
 			<div class="btn"><a href=""><button></button></a></div>
 			
 		</div>

 		
 	</header>

 	<section id="qwer">
	 		<div class="top">
	 			<h1>Please Sign In</h1>
	 			<p><img  width="20px" height="20px" src="img/hh.png">Secure</p>

	 		</div>
	 		<hr>

	 		<div class="center">
	 			<div class="center-left"><h2>Sign in to Apple Store</h2>
				<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
					<label for="username">Введите ваш логин:</label>
					<input type="text" name="username">
					<label for="password">Введите ваш пароль:</label>
					<input type="password" name="password1">
					<label for="password">Введите пароль еще раз:</label>
					<input type="password" name="password2">
					<button class="lll" type="submit" name="submit">Create</button>
				</form>

			</div>
			<div class="center-right">
	 				<p>You can use your Apple ID for other <br>Apple services such as</p>
	 				<ul>
	 					<li>App Store</li>
	 					<li>iTunes Store</li>
	 					<li>iPhoto Print Products</li>
	 					<li>iCloud</li>
	 				</ul>
	 				<a href="signup.php">Don't have an Apple ID? Create one now.</a>
	 			</div>
	 		</div>
	 		<hr>
	 		<div class="bottom">
	 			<button class="button">Cancel</button>

	 			<p>Questions? Just ask. 1-800-MY-APPLE</p>
	 		</div>
	 	</section>
 	
 	<footer>
 		<section>
			<div id= "xcv" class="kl">More ways to shop: Visit an  <a href="">Apple Store</a>, call 1-800-MY-APPLE, or  <a href="">find a reseller</a></div>
		<hr>
			<div class="kl"><div>Copyright © 2017 Apple Inc. All rights reserved.</div><div><a href="">Privacy Policy</a>|<a href="">Terms of Use</a>|<a href="">Sales and Refunds</a>|<a href="">Legal</a>|<a href="">Site Map</a></div>
				<a id="son" href=""><div><img height="12px" width="12px" src="img/til.png"></div><div>United States</div></a>
			</div>
		</section>
 	</footer>
 	<script>
	function openNav() {
	    document.getElementById("myNav").style.width = "100%";
	}

	function closeNav() {
		    document.getElementById("myNav").style.width = "0%";
		}
		var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	    acc[i].onclick = function(){
	        this.classList.toggle("active");
	        var panel = this.nextElementSibling;
	        if (panel.style.display === "block") {
	            panel.style.display = "none";
	        } else {
	            panel.style.display = "block";
	        }
	    }
	}

	</script>
 </body>
 </html>


