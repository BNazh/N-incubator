<?php
$dbc = mysqli_connect('localhost', 'root', '', 'lesson') OR DIE('Ошибка подключения к базе данных');
if(isset($_POST['submit'])){
	$zagolov = mysqli_real_escape_string($dbc, trim($_POST['zagolov']));
	$Rubrika = mysqli_real_escape_string($dbc, trim($_POST['cars']));
	$price = mysqli_real_escape_string($dbc, trim($_POST['price']));

	$Telefon = mysqli_real_escape_string($dbc, trim($_POST['tel']));
	$adress	 = mysqli_real_escape_string($dbc, trim($_POST['adress']));
	$Pochta = mysqli_real_escape_string($dbc, trim($_POST['Pochta']));
	
	$Region = mysqli_real_escape_string($dbc, trim($_POST['Region']));

	$Opisanie = mysqli_real_escape_string($dbc, trim($_POST['Opisanie']));

	if(!empty($zagolov)  ) {
		$query = "SELECT * FROM `obiv` WHERE  like_user_id = '".$_COOKIE["user_id"]."' AND
		  Rubrika = '".$Rubrika."'  AND Telefon = '".$Telefon."' AND price = '".$price."'
		  AND adress = '".$adress."' AND  Pochta = '".$Pochta."'  AND  Region = '".$Region."'
		  AND Opisanie = '".$Opisanie."' AND Zagalovok = '".$zagolov."'  ";
		$data = mysqli_query($dbc, $query);
		if(mysqli_num_rows($data) == 0) {
			$query =" INSERT INTO `obiv` (`like_user_id`, `id`, `Telefon`, `price`, `adress`, `Pochta`, `Region`, `Opisanie`, `Zagalovok`, `Rubrika`) VALUES ('".$_COOKIE["user_id"]."', NULL, '$Telefon', '$price', '$adress', '$Pochta', '$Region', '$Opisanie', '$zagolov', '$Rubrika') ";
			mysqli_query($dbc,$query);
			echo 'Всё готово';
			mysqli_close($dbc);
			exit();
		}
		else {
			echo 'уже существует';
		}

	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Объявление</title>
	
	<link rel="stylesheet" type="text/css" href="ads.css">
	<meta charset="utf-8">
	<script type="text/javascript" src="javaScript/ads.js"></script>
</head>
<body>
	<div id="myNav" class="overlay">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
	    <a href="Buy.php">Mac</a>
	    <hr>
	    <a href="index.php">iPad</a>
	    <hr>
	    <a href="index.php">iPhone</a>
	    <hr>
	    <a href="index.php">Watch</a>
	    <hr>
	    <a href="index.php">TV</a>
	    <hr>
	    <a href="index.php">Music</a>
	    <hr>
	    <a href="Support.php">Support</a>
	    <hr>
	    <div class="or1">
				 
				<input placeholder="Search apple.com" style="font-size: 22px;" type="" id="inps" name="">
		</div>
	   	<hr>
	  </div>
	</div>


	<header id="kx">
 		<div id="kn">

 			<span class="menuqw" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
 			<div class="logoimg"><a href=""><img src="img/a.jpg"></a></div>
 			<div class="menuheader">
 				<ul type="none">
 						<li><a href="index.php">Mac</a> </li>
 						<li><a href="index.php">iPad</a> </li>
 						<li><a href="index.php">iPhone</a> </li>
 						<li><a href="index.php">Watch</a> </li>
 						<li><a href="index.php">TV</a> </li>
 						<li><a href="index.php">Music</a> </li>
 						<li><a href="Support.php">Support</a> </li>

 				</ul>
 			</div>
 			<div class="input"><a href=""><img src="img/c.jpg"></a></div>
 			<div class="btn"><a href=""><button></button></a></div>
 			</a>
 		</div>
 
	</header>
	

	<main class="main">
		<section class="info">
			<img src="market/info.png">
		</section>
		<section class="container">
				<h1 lass="color-orange">Подать объявление 
				на Apple.com</h1>
				<form action="ads.php?obivlenie=yes" method="POST" class="form">
					
					<div id ="error-block" class="error-block">
						<p>Вы не заполнили обязательные поля или ввели их в неверном формате, проверьте форму еще раз.</p>
					</div>	
					<div class="display">
						<div class="left-display">
							<label><b class = "error" id="info-text">Заголовок</b></label>
						</div>	
						<div class="input1">
							<input id="info" size="60" type="text" name="zagolov">
							<h6 class="color-gray">70 знаков</h6>
						</div>	
					</div>

					<div class="display">
						<div class="left-display">
							<label class="label">Рубрика</label>
						</div>
						<div class="input1">
							<select value="" name="cars">
								<option>Mac</option>
								<option>iPhone</option>
								<option>iPad</option>
								<option>Watch</option>
							</select>
						</div>
					</div>
					
					<div class="display">
						<div class="left-display">
							<b id="price-text" class="label">Цена</b>
						</div>
						<div class="check-container">
							<div class="box">
								<input id="price" class="input-text" type="text" name="price">тг
							</div>
							
							
						</div>
						
					</div>

					<div class="display">
							
					</div>
					<div class="display">
							<div class="left-display">
								<label>Описания</label>
							</div>
							<div class="input1">
								<input class="textarea" type="textarea" name="Opisanie">
								<h6 class="color-gray">3000 знаков</h6>
						</div>
					</div>
				

			

				
			
			
					<div class="display">
						<div class="left-display">
							<label><b id="region-text">Регион*</b></label>
						</div>
						<div class="input1">
							<select name="Region" id="regions">
								<option value="-1">Chosen</option>
								<option>Akmola</option>
								<option>Aktobe</option>
								<option>Alamaty</option>
								<option>Atray</option>
								<option>Jambil</option>
								<option>Karagandi</option>
									
							</select>
						</div>	
					</div>
					<div class="display">
						<div class="left-display">
							<label  class="label">Телефон</label>
						</div>
						<div class="phone-container">	
							<div class="number-phone">
								<div>
									<input name="tel" class="phone" type="number" value="+7 (___) ___-__-__"" data-completed="0" placeholder="+7 (___) ___-__-__">
								</div>
								
							</div>
							
						</div>	
					</div>
					<div class="display">
						<div class="left-display">
							<label>Адрес</label>
						</div>
						<div class="input1">
							<input  size="60"  type="text" name="adress">
							<h6 class="color-gray">55 знаков</h6>							
						</div>	
					</div>
					<div class="display">
						<div class="left-display">
							<label><b id="email-text">Электронная почта</b></label>
						</div>
						<div class="input1">
							<input  size="60"  id="email" type="text" name="Pochta">
															
						</div>	
					</div>

					
					
					
					<div  class="sub-button application-button length">
						<input onclick="submitEvent()" id="submit" type="submit" class="application" value="Подать объявление" name="submit" >
							
					</div>


				</form>
		</section>
		

	</main>
	<hr>
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