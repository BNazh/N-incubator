 <!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="Buy.css">
</head>
<body>

	<div id="myNav" class="overlay">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
	    <a href="">Mac</a>
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
	    <div class="qwem2">
				 
				<input placeholder="Search apple.com" style="font-size: 22px;" type="" id="inps" name="">
		</div>
	   	<hr>
	  </div>
	</div>



	<header id="kx">
 		<div id="kn">

 			<span class="menuqw" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
 			<div class="logoimg"><a href="index.php"><img src="img/a.jpg"></a></div>
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
 			<div class="btn"><a href=""><button></button></a</div>
 			
 		</div>

 		
 	</header>


 	<section class="mnmns">
		<section class="sect1">
			<div class="div2">
				
				<a href=""><h1>MacBook</h1></a>
			</div>

			<div class="div1">
				<a href="">Overview</a>
				<a href="">macOS</a>
				<a href="">Tech Specs</a>
			</div>
	</section>
		</section>
	<div class="sect2"><p>Trade in your eligible computer and get credit towards a new Mac. <a href="">Learn more ></a></p></div>
	<div class="mjue">
		<div class="znnn">
			<div id="bigImage">
		      <img id="big" src="https://www.goldgenie.com/wp-content/uploads/2016/08/ip7-landing-thumb.jpg"/>
		    </div>
		    <div id="carousel1">
		          <img onclick="clickImage1()" id="i1" src="https://www.goldgenie.com/wp-content/uploads/2016/08/ip7-landing-thumb.jpg"/>
		          <img  onclick="clickImage2()" id="i2" src="http://karalux.net/wp-content/uploads/2015/09/ip-4.jpg"/>
		          <img  onclick="clickImage3()" id="i3" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudryifnibI3QRJaKRxVJdRznTY1M5xcchVwOwj5kzTJV0UbeR"/>
		          <img  onclick="clickImage4()" id="i4" src="http://www.brikk.com/uploads/2/4/0/9/24098382/s778481183918088934_p89_i22_w640.jpeg"/>
		          <img  onclick="clickImage5()" id="i5" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlrxkq7-jqatMTC9LCYYqEH4JRgETs1QUQp974Ot_EohK6OUx2cA"/>
		    </div>

		    
		</div>


		<?php
	        $conn = mysqli_connect("localhost", "root", "", "lesson");
	        if (!$conn) {
	          	die("Connection failed: " . mysqli_connect_error());
	        }
	        $sql = "SELECT * FROM `obiv`";
	        $result = mysqli_query($conn, $sql);
		        if (mysqli_num_rows($result) > 0) { 
              		while($row = mysqli_fetch_assoc($result)) {
			            if($row['id']==intval($_GET['id'])){		              	
			              	echo "<div class='fghjkl'>
								<h1>".$row['Rubrika'].'  '.$row['Zagalovok']."</h1>
								
								<table border='1px'  style= 'border:1px solid silver; border-collapse: collapse;float: top; margin-left: 2%;margin-right: 2%;''>
									<tr>
										<th>Opisanie</th>
										<td>".$row['Opisanie']."</td>
									</tr>

									<tr>
										<th>Price</th>
										<td><h2 style='text-align: center;color:red;'>".$row['price']."$</h2></td>
									</tr>
									<tr>
										<th>Adress:</th>
										<td style='text-align: center;color:black;'>".$row['adress']."</td>
									</tr>
									<tr>
										<th>Pochta:</th>
										<td style='text-align: center;color:black;'>".$row['Pochta']."</td>
									</tr>
									<tr>
										<th>Telefon:</th>
										<td style='text-align: center;color:black;'>".$row['Telefon']."</td>
									</tr>
									<tr>
										<th>Region:</th>
										<td style='text-align: center;color:black;'>".$row['Region']."</td>
									</tr>
									
								</table>
								<table class='iuytr'>
									<tr >
										<th><button><h1 style='color:white;' >Kupit
										</h1></button></th>
										<th><button><h1 style='color:white;'>V korzinu</h1></button></th>
									</tr>
								</table>
							</div>
			              	";


			            }
			        }
			    }
			              
		        
	?>
		
	</div>
	<div class="sect3">
		<h1>Choose your new MacBook and <br>select a finish.</h1>
		<h3>12-inch MacBook</h3>
		<p>Get help buying. <a href="">Chat now</a> or call 1-800-MY-APPLE.</p>
	</div>

	

	<div class="sect4">
		<h1>Compare Mac models.</h1>
		<a href="">Find the best Mac for you ></a><br>
		<p></p>
		<img width="741px" height="335px" src="img/mac-family-compare-201706.jpeg">

	</div>

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


	function clickImage1(){
	var value1 = document.getElementById("i1").src;
	
	document.getElementById("big").src=value1;
}

function clickImage2(){
	var value1 = document.getElementById("i2").src;
	document.getElementById("big").src=value1;
}

function clickImage3(){
	var value1 = document.getElementById("i3").src;
	document.getElementById("big").src=value1;
}

function clickImage4(){
	var value1 = document.getElementById("i4").src;
	document.getElementById("big").src=value1;
}

function clickImage5(){
	var value1 = document.getElementById("i5").src;
	document.getElementById("big").src=value1;
}
	</script>
</body>
</html>