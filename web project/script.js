let a = true;
function menu(){
	
	if(a){
		document.querySelector(".dropdown").classList.remove("dontshow");
		document.querySelector(".dropdown").classList.add("show");
		a=false;
	}
	else{
		document.querySelector(".dropdown").classList.remove("show");
		document.querySelector(".dropdown").classList.add("dontshow");
		a=true;
	}
}