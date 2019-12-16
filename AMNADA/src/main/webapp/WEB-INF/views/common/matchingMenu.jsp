<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}



/*  */
			.btn {
			  all: unset;
			  cursor: pointer;
			  background-color: white;
			  color: #fd6584;
			  /* padding: 1em 2em; */
			      padding: 0em 2em;
			}
			.button--flip {
			  transform-style: preserve-3d;
			  position: relative;
			  transition: transform 290ms ease-in-out;
			}
			.button--flip .button__face {
			  /* transform: translateZ(1.5em); */
			  transform: translateZ(0.5em);
			   /*  background-color: black;  */
			}
			.button--flip .button__top {
			  margin-left: 135px; 
			  position: absolute;
			  top: 0;
			  left: 0;
			  right: 0;
			  bottom: 0;
			  transform: translateY(50%) rotateX(-90deg);
			  background-color: #fd6584;
			  color: white;
			}		
			.button--flip:hover {
			  transform-origin: center;
			  transform: rotateX(90deg);
			}

/*  */




.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 2;
  top: 0;
  left: 0;
  background-color: #febebe; /* mistyrose, bisque, cornsilk */
  background-color: white;
  overflow-x: hidden;
/*   transition: 0.5s; */
  padding-top: 60px;
  border-right: 2px solid ;
  font-size: 25px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  /* color: #f1f1f1; */
  color: #fd6584;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}
#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#but{
	font-size: 20px;
	font-weight: bold;
    margin: 20px;
}
</style>
</head>
<body>

<!-- <div id="mySidenav" class="sidenav">
  <a>Profile</a>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  	<img alt="사진없음" src="me.jpg" style="width: 400px; height: 400px; margin-left: 22px; border-radius: 100px;">
  <a class="menuBtn" href="#">About</a>
  <a class="menuBtn" href="#">Services</a>
  <a class="menuBtn" href="#">Clients</a>
  <a class="menuBtn" href="#">Contact</a>
</div> -->


<div id="mySidenav" class="sidenav">
  <a>Profile</a>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  	<!-- <img alt="사진없음" src="me.jpg" style="width: 400px; height: 400px; margin-left: 22px; border-radius: 100px;"> -->
  	<img alt="사진없음" src="resources/face/G.jpg" style="width: 400px; height: 400px; margin-left: 22px; border-radius: 100px;">
	
	<div id="but" align="center">
		 <div class="button button--flip">
			 <button class="btn button__face">결제</button><button class="btn button__top" style="margin-left: 137px;">결제</button>
		 </div>
		 <br>
		 <div class="button button--flip">
		 	<button class="btn button__face">Services</button><button class="btn button__top" style="margin-left: 128px;">Services</button>
		 </div>
		 <br>
		 <div class="button button--flip">
		 	<button class="btn button__face">Clients</button><button class="btn button__top" style="margin-left: 133px;">Clients</button>
		 </div>
		 <br>
		 <div class="button button--flip">
		 	<button class="btn button__face">Contact</button><button class="btn button__top" style="margin-left: 129px;">Contact</button>
		 </div> 
 	</div>
</div>



<!-- <div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; AMANDA</span>
</div> -->

<script>

$(function() {
	 document.getElementById("mySidenav").style.width = "450px";
});
	function openNav() {
	 // document.getElementById("mySidenav").style.width = "450px";
	 // document.getElementById("main").style.marginLeft = "450px";  
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";  
	}
</script>
   
</body>

</html> 
