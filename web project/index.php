<?php 
if(isset($_GET['delete'])){
	unset($_COOKIE['user_id']);
	setcookie("user_id", "", time() - 3600);
}
?>
<!DOCTYPE html>
 <html>
 <head>
 	<title></title>
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">

 	<link rel="stylesheet" type="text/css" href="Main.css">
 	<script src="script.js" defer></script>
 	
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
 						<li><a href="page1.php">Mac</a> </li>
 						<li><a href="page1.php">iPad</a> </li>
 						<li><a href="page1.php">iPhone</a> </li>
 						<li><a href="page1.phpl">Watch</a> </li>
 						<li><a href="page1.php">TV</a> </li>
 						<li><a href="page1.php">Music</a> </li>
 						<li><a href="Support.php">Support</a> </li>

 				</ul>
 			</div>
 			<div class="input"><a href=""><img src="img/c.jpg"></a></div>
 			<div class="btn"><button onclick="menu()"></button>
 					<div class="dropdown dontshow">
 						<a href="bag.php">Bag</a>
 						<a href="log.php">Sign in</a>
 						<a href="ads.php"><?php echo  empty($_COOKIE['user_id'])?"":"Submit your add";
 						 ?></a>
 						<a href="index.php?delete=ok"><?php echo  empty($_COOKIE['user_id'])?"":$_COOKIE['user_id']." Sign out";
 						 ?></a>
 					</div>

 			</div>
 			
 		</div>

 		
 	</header>

 	
 	<section>
   
 		<div id = "slider">
 			<img src="img/xq.png" width="100%" height="100%">
			<ul id = "slides">
				<!-- <li class = "slide showing"><img src="images/1.jpg" width="100%" ></li> -->
				<li class="slide"><img  src="img/xq.png" width="100%" height="100%"></li>
				<li class="slide"><img src="img/j.jpg" width="100%" height="100%"></li>
				<li class="slide"><img src="img/op.png" width="100%" height="100%"></li>
			</ul>
		</div>	
	</section>
		<!-- <div id="z">
	 			<a href="index.php"><img src="img/xq.png"></a>
	 	</div>

	 	<div id="t">
	 		<a href=""><img src="img/j.jpg"></a>
	 	</div>
	 	<div id="opo">
	 		<a href=""><img src="img/op.png"></a>
	 	</div> -->
	 	<div class="opwo">
	 		<a href=""><img src="img/asp.png"></a>
	 		<a href=""><img src="img/asp2.png"></a>
	 	</div >

	 	<div class="opwo">
	 		<a href=""><img src="img/ter.png"></a>
	 		<a href=""><img src="img/ter1.png"></a>
 	</div>

	</section>

	<footer>
		<nav class="nav1">
			<div>
				<ul type="none">

					<li ><h3>Shop and Learn</h3></li>
					<button class="accordion">Shop and Learn</button>
					<span class="panel">
						<li><a href="">Mac</a></li>
						<li><a href="">iPad</a></li>
						<li><a href="">iPhone</a></li>
						<li><a href="">Watch</a></li>
						<li><a href="">TV</a></li>
						<li><a href="">Music</a></li>
						<li><a href="">HomePod</a></li>
						<li><a href="">iPod touch</a></li>
						<li><a href="">Assessories</a></li>
						<li><a href="">Gift Cards</a></li>
					</span>

				</ul>
			</div>

			<div>
				<ul type="none">
					<li ><h3>Apple Store</h3></li>
					<button class="accordion">Apple Store</button>
					<span class="panel">
						<li><a href="">Find a Store</a></li>
						<li><a href="">Genius Bar</a></li>
						<li><a href="">Today at Apple</a></li>
						<li><a href="">Apple Camp</a></li>
						<li><a href="">Apple Store App</a></li>
						<li><a href="">Refurbished and Clearance</a></li>
						<li><a href="">Financing</a></li>
						<li><a href="">Reuse and Recycling</a></li>
						<li><a href="">Order Status</a></li>
						<li><a href="">Shopping Help</a></li>
					</span>
				</ul>
			</div>
			<div>
				<ul type="none">
					<li ><h3>For Education</h3></li>
					<button class="accordion">For Education</button>
					<span class="panel">
						<li><a href="">Apple and Education</a></li>
						<li><a href="">Shop for College</a></li>
					</span>

					<li ><h3>For Business</h3></li>
					<button class="accordion">Accoun</button>
					<span class="panel">
						<li><a href="">Apple and Business</a></li>
						<li><a href="">Shop for Business</a></li>
					</span>

				</ul>
			</div>

			<div>
				<ul type="none">

					<li ><h3>Account</h3></li>
					<button class="accordion">Accoun</button>
					<span class="panel">
						<li><a href="">Manage Your Apple ID</a></li>
						<li><a href="">Apple Store Account</a></li>
						<li><a href="">iCloud.com</a></li>
					</span>

					<li ><h3>Apple Values</h3></li>
					<button class="accordion">About Values</button>
					<span class="panel">
						<li><a href="">Accessibility</a></li>
						<li><a href="">Education</a></li>
						<li><a href="">Environment</a></li>
						<li><a href="">Inclusion and Diversity</a></li>
						<li><a href="">Privacy</a></li>
						<li><a href="">Supplier Responsibility</a></li>
					</span>

				</ul>
			</div>

			<div>
				<ul type="none">
					<li ><h3>About Apple</h3></li>
					<button class="accordion">About Apple</button>
					
					<span class="panel">
						<li><a href="">Newsroom</a></li>
						<li><a href="">Apple Leadership</a></li>
						<li><a href="">Job Opportunities</a></li>
						<li><a href="">Investors</a></li>
						<li><a href="">Events</a></li>
						<li><a href="">Contact Apple</a></li>
					</span>
					

				</ul>
			</div>
			
		</nav>


		<section>
			<div id= "xcv" class="kl">More ways to shop: Visit an  <a href="">Apple Store</a>, call 1-800-MY-APPLE, or  <a href="">find a reseller</a></div>
		<hr>
			<div class="kl"><div>Copyright © 2017 Apple Inc. All rights reserved.</div><div><a href="">Privacy Policy</a>|<a href="">Terms of Use</a>|<a href="">Sales and Refunds</a>|<a href="">Legal</a>|<a href="">Site Map</a></div>
				<a id="son" href=""><div><img height="12px" width="12px" src="img/til.png"></div><div>United States</div></a>
			</div>
		</section>

	</footer>
	<script>
	var slides = document.querySelectorAll('#slides .slide');
	var currentSlide = 0;
	var slideInterval = setInterval(nextSlide,2000);

	function nextSlide() {
		slides[currentSlide].className = 'slide';
		currentSlide = (currentSlide+1)%slides.length;
		slides[currentSlide].className = 'slide showing';
	}


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

	$(".selector").on("mouseover", function () {
    //stuff to do on mouseover
});
	</script>
 </body>
 </html>