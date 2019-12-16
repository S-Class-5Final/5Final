<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lato');
body {
/*   background-color: #000000; */
  /* background-color: #febebe; */
   background-color: #ffdcdc; 
/*   background-color: white; */
  color: rgba(255, 255, 255, 0.7);
  font-family: 'Lato', sans-serif;
  margin: 20px;
}

.menu {
  text-transform: uppercase;
  /* color: rgba(255, 255, 255, 0.8); */
/*   font-weight: bolder; */
<<<<<<< HEAD
  color: #fd6584; /* #ff5a5a, ff6464 */
  font-weight: 900;
  font-size: 20px;
  margin-left: 860px;
  
  display: inline-block;
  cursor: pointer;
  pointer-events: none;
  position: absolute;
  bottom: 20px;
  left: 20px;
}
.menu:hover {
  pointer-events: all;
}
.label {
  display: inline-block;
  cursor: pointer;
  pointer-events: all;
}
/* 구분선  */
.spacer {
  display: inline-block;
  width: 80px;
  margin-left: 15px;
  margin-right: 15px;
  vertical-align: middle;
  cursor: pointer;
  position: relative;
}
/* 호버 이후 구분선 */
.spacer:before {
  content: "";
  position: absolute;
  border-bottom: 1px solid #ff6464;
  height: 1px;
  width: 0%;
  transition: width 0.25s ease;
  transition-delay: 0.7s;
}
.item {
  position: relative;
  display: inline-block;
  margin-right: 30px;
  top: 10px;
  opacity: 0;
  transition: opacity 0.5s ease, top 0.5s ease;
  transition-delay: 0;
}
span {
  transition: color 0.5s ease;
}
.item:hover span {
  color: #ff0000;
}
.menu:hover .spacer:before {
  width: 100%;
  transition-delay: 0s;
}
.menu:hover .item {
  opacity: 1;
  top: 0px;
}
.item:nth-child(1) {
  transition-delay: 0.45s;
}
.item:nth-child(2) {
  transition-delay: 0.4s;
}
.item:nth-child(3) {
  transition-delay: 0.35s;
}
.item:nth-child(4) {
  transition-delay: 0.3s;
}
.item:nth-child(5) {
  transition-delay: 0.25s;
}
.item:nth-child(6) {
  transition-delay: 0.2s;
}
.item:nth-child(7) {
  transition-delay: 0.15s;
}
.item:nth-child(8) {
  transition-delay: 0.1s;
}
.item:nth-child(9) {
  transition-delay: 0.05s;
}
.item:nth-child(10) {
  transition-delay: 0s;
}
.menu:hover .item:nth-child(1) {
  transition-delay: 0.25s;
}
.menu:hover .item:nth-child(2) {
  transition-delay: 0.3s;
}
.menu:hover .item:nth-child(3) {
  transition-delay: 0.35s;
}
.menu:hover .item:nth-child(4) {
  transition-delay: 0.4s;
}
.menu:hover .item:nth-child(5) {
  transition-delay: 0.45s;
}
.menu:hover .item:nth-child(6) {
  transition-delay: 0.5s;
}
.menu:hover .item:nth-child(7) {
  transition-delay: 0.55s;
}
.menu:hover .item:nth-child(8) {
  transition-delay: 0.6s;
}
.menu:hover .item:nth-child(9) {
  transition-delay: 0.65s;
}
.menu:hover .item:nth-child(10) {
  transition-delay: 0.7s;
}

</style>
</head>
<body>
  	<div class="menu">
  		  <div class="label">AMANDA&nbsp;&nbsp;&nbsp;</div>	
		  <div class="label">Follow Us</div>
		  <div class="spacer"></div>
		  <div class="item"><span>Twitter</span></div>
		  <div class="item"><span>Instagram</span></div>
		  <div class="item"><span>Flickr</span></div>
		  <div class="item"><span>Behance</span></div>
		  <div class="item"><span>MixCloud</span></div>
=======
  color: #ff6464; /* #ff5a5a, ff6464 */
  font-weight: 900;
  font-size: 20px;
  /* margin-left: 860px; */
  margin-left: 55%;
  
  display: inline-block;
  cursor: pointer;
  pointer-events: none;
  position: absolute;
  bottom: 20px;
  left: 20px;
}
.menu:hover {
  pointer-events: all;
}
.label {
  display: inline-block;
  cursor: pointer;
  pointer-events: all;
}
/* 구분선  */
.spacer {
  display: inline-block;
  width: 80px;
  margin-left: 15px;
  margin-right: 15px;
  vertical-align: middle;
  cursor: pointer;
  position: relative;
}
/* 호버 이후 구분선 */
.spacer:before {
  content: "";
  position: absolute;
  border-bottom: 1px solid #ff6464;
  height: 1px;
  width: 0%;
  transition: width 0.25s ease;
  transition-delay: 0.7s;
}
.item {
  position: relative;
  display: inline-block;
  margin-right: 30px;
  top: 10px;
  opacity: 0;
  transition: opacity 0.5s ease, top 0.5s ease;
  transition-delay: 0;
}
span {
  transition: color 0.5s ease;
}
.item:hover span {
  color: #ff0000;
}
.menu:hover .spacer:before {
  width: 100%;
  transition-delay: 0s;
}
.menu:hover .item {
  opacity: 1;
  top: 0px;
}
.item:nth-child(1) {
  transition-delay: 0.45s;
}
.item:nth-child(2) {
  transition-delay: 0.4s;
}
.item:nth-child(3) {
  transition-delay: 0.35s;
}
.item:nth-child(4) {
  transition-delay: 0.3s;
}
.item:nth-child(5) {
  transition-delay: 0.25s;
}
.item:nth-child(6) {
  transition-delay: 0.2s;
}
.item:nth-child(7) {
  transition-delay: 0.15s;
}
.item:nth-child(8) {
  transition-delay: 0.1s;
}
.item:nth-child(9) {
  transition-delay: 0.05s;
}
.item:nth-child(10) {
  transition-delay: 0s;
}
.menu:hover .item:nth-child(1) {
  transition-delay: 0.25s;
}
.menu:hover .item:nth-child(2) {
  transition-delay: 0.3s;
}
.menu:hover .item:nth-child(3) {
  transition-delay: 0.35s;
}
.menu:hover .item:nth-child(4) {
  transition-delay: 0.4s;
}
.menu:hover .item:nth-child(5) {
  transition-delay: 0.45s;
}
.menu:hover .item:nth-child(6) {
  transition-delay: 0.5s;
}
.menu:hover .item:nth-child(7) {
  transition-delay: 0.55s;
}
.menu:hover .item:nth-child(8) {
  transition-delay: 0.6s;
}
.menu:hover .item:nth-child(9) {
  transition-delay: 0.65s;
}
.menu:hover .item:nth-child(10) {
  transition-delay: 0.7s;
}

</style>
</head>
<body>
  	<div class="menu">
  		  <!-- <div class="label">AMANDA&nbsp;&nbsp;&nbsp;</div> -->	
		  <div class="label">Follow Us</div>
		  <div class="spacer"></div>
		  <div class="item"><span>Twitter</span></div>
		  <div class="item"><span>Instagram</span></div>
		  <div class="item"><span>Flickr</span></div>
		  <div class="item"><span>Behance</span></div>
>>>>>>> refs/remotes/origin/master
	</div>
</body>
</html>