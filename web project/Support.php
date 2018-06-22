<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="Main.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="script.js" defer></script>
</head>
<body>
	<div id="myNav" class="overlay">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <div class="overlay-content">
	    <a href="index.php">Mac</a>
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
 			<div class="btn"><button onclick="menu()"></button>
 					<div class="dropdown dontshow">
 						<a href="bag.php">Bag</a>
 						<a href="log.php">Sign out</a>
 						<a href="ads.php"><?php echo  empty($_COOKIE['user_id'])?"":"Submit your add";
 						 ?></a>
 						<a href="Support.php?delete=ok"><?php echo  empty($_COOKIE['user_id'])?"":$_COOKIE['user_id']." Sign out";
 						 ?></a>
 					</div>

 			</div>
 			
 		</div>

 		
 	</header>
 	<section class="section-1">
	 	<div id="q">
		 	<h2 id="f">Support</h2>
		 	<div id="re">  <a href="">Communities</a><a href="">Contact Support</a></div>
		 	<hr>
		</div>
		<div class="Erke">
			<h1>Welcome to Apple Support</h1><p>We're here to help</p> 
			
			<div class="or10">
				<img id="search" width="40px" height="40px" src="img/serqw.jpg">
				<input placeholder="Search Support" style="font-size: 22px;" type="" id="inps1" name="">
			</div>
		</div>
	</section>
	<section class="section-2">
		<h2>Get help and learn</h2>
		<div class="aa">
			<div>
				<div><a href=""><img src="img/homepage_productdrawer_ipod_2x.png">iPod</a>
					<a href=""><img src="img/b.png">TV</a>
				</div>
				<div>
					<a href=""><img src="img/c.png">iPad</a>
					<a href=""><img src="img/d.png">iPhone</a>
				</div>
				<div>
					<a href=""><img src="img/e.png">iTunes</a>
					<a href=""><img src="img/f.png">Apple ID</a> 
				</div>
			</div>
		</div>
	</section>
		<hr>
	<section class="section-3">
		
			<a href="">More products</a>
		
	</section>
	<hr>
	<section class="section-4">
		<div id="section-isi">
			<h1>Get the latest software on your devices</h1>
			<p>With iOS 11 and macOS High Sierra, your devices are more reliable, capable, and responsive than ever before. Learn what you can do with these powerful operating systems.</p>

			<a href="">Update to iOS 11 ></a>
			<a href="">Upgrade to macOS High Sierra ></a>
		</div>
		<div><img src="img/fro.jpg"></div>

	</section>
	<hr>
	<section class="section-5">
		
			<div class="sectd"><img src="img/appSu.png"><h1>Find out about your coverage</h1>
					<p><a href="">AppleCare products</a> give you additional repair coverage and technical support. If you already bought an AppleCare product, you can <a href="">manage it online</a></p>
					<p><a href="">Check coverage for your product ></a></p>
			</div>
			<div class="sectd">
					<img src="img/pepSu.png"><h1>Let’s get that fixed</h1>
					<p>If your Apple device needs repairs, you can go to an Apple Store, visit an Authorized Service Provider, or mail in your device. Whatever you choose, we’ll make sure your device works the way it should.</p>
					<p><a href="">Choose a repair option ></a>
			</div>
		
		<p></p>
		
	</section>
	<hr>
	<section class="section-6">
		<div>
			<h2>Beware of counterfeit parts</h2>

			<p>Some counterfeit and third party power adapters and batteries may not be 
				designed properly and could result in safety issues. To ensure you receive a genuine Apple battery 
					during a battery replacement, we recommend visiting an <a href="">Apple Store</a> or 
				<a href="">Apple Authorized Service Provider</a>. If you need a replacement adapter to
				  charge your Apple device, we recommend getting an Apple power adapter.

				Also non-genuine replacement displays may have compromised visual quality and may fail to work correctly. Apple-certified screen repairs are performed by trusted experts who use genuine Apple parts.</p>
		</div>
	</section>


	<hr>
	<section class="section-5">
		
			<div class="sectd"><img src="img/peoplSu.png"><h1>Have a question?<br>Ask everyone.</h1>
				<p>The members of our Apple Support Community can help answer your question. Or, if someone’s already asked, you can search for the best answer.</p>
				<p><a href="">Ack now ></a></p>
			</div>
			<div class="sectd">
				<img src="img/sotSu.png"><h1>Learn something new every day with @AppleSupport</h1>
				<p>We're here to help you get the most from your Apple product. Tweet us your question to get support or follow us for helpful tips and videos.</p>
				<p><a href="">See more @AppleSupport on Twitter ></a>
			
		</div>
		<p></p>
		
	</section>

	<section id="qwqqh">
		<div id="erts">
			<h1>Join us for Today at Apple sessions.</h1>
			<p>Explore how to capture photos with iPhone. Learn to sketch on iPad. And do more of what you love every day at Apple.</p>
			<a href="">Sign up for sessions near you ></a>
		</div>
		<img src="img/jzadSu.jpg">
		
	</section>

	<section class="section-5">
		<div id="klp">
			<h1>Want to talk with someone?</h1>
			<p>Get help by phone, chat, or email, set up a repair, or make a Genius Bar reservation.</p>
			<a href="">Contact Apple Support for help ></a>
		</div>

		<div id="klp1">
			<img src="img/ekiSu.png">
		</div>
		
	</section>

	<hr>


	<section class="section-7">
		<div id="bxqw">
		<h1>Exchange and Repair Extension Programs</h1>
	
		<a href="">iPhone 6s Program for Unexpected Shutdown Issues</a>
		<a href="">Multi-Touch Repair Program for iPhone 6 Plus</a>
		<a href="">Apple AC Wall Plug Adapter Recall Program</a>
		<a href="">Apple USB-C Charge Cable Replacement Program</a>
		<a href="">Beats Pill XL Speaker Recall Program</a>
		<a href="">All Programs</a>
		</div>
	</section>

	<footer>
		<nav class="nav1">
			<div>
				<ul type="none">
					<li ><h3>Service & Support</h3></li>
					<button class="accordion">Service & Support</button>
						<span class="panel">
							<li><a href="">Complimentary Support</a></li>
							<li><a href="">Hardware Warranties</a></li>
							<li><a href="">Software License Agreements</a></li>
							<li><a href="">Apple Repair</a></li>
							<li><a href="">Service Answer Center (FAQs)</a></li>
						</span>

				</ul>
			</div>

			<div>
				<ul type="none">
					<li ><h3>Programs</h3></li>
					<button class="accordion">Programs</button>
						<span class="panel">
							<li><a href="">Apple Training</a></li>
							<li><a href="">Education Resources</a></li>
							<li><a href="">Apple Consultants Network</a></li>
							<li><a href="">Apple Service Programs</a></li>
						</span>

				</ul>
			</div>
			<div>
				<ul type="none">
					<li ><h3>Resources</h3></li>
					<button class="accordion">Programs</button>
						<span class="panel">
							<li><a href="">Downloads & Updates</a></li>
							<li><a href="">Manuals</a></li>
							<li><a href="">Tech Specs</a></li>
							<li><a href="">System Status</a></li>
							<li><a href="">Accessibility</a></li>
							<li><a href="">Support Site Map</a></li>
						</span>

				</ul>
			</div>

			<div>
				<ul type="none">
					<li ><h3>Contact</h3></li>
					<button class="accordion">Programs</button>
						<span class="panel">
							<li><a href="">Support Phone Numbers</a></li>
							<li><a href="">iTunes Store Support</a></li>
							<li><a href="">Contact a Mobile Carrier</a></li>
						</span>
					
					

				</ul>
			</div>

			
			
		</nav>
		<section>
			<div id= "xcv" class="kl">More ways to shop: Visit an  <a href="">Apple Store</a>, call 1-800-MY-APPLE, or  <a href="">find a reseller</a></div>
		<hr>
			<div class="kl"><div>Copyright © 2017 Apple Inc. All rights reserved.</div><div> <a href="">Privacy Policy</a>|<a href="">Terms of Use</a>|<a href="">Sales and Refunds</a>|<a href="">Legal</a> | <a href="">Site Map</a></div>
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