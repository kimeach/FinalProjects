<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
 
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>	
  <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/demo.css" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/backgroundTransition.css" />
  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/jquery/backgroundTransition.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.7.1/modernizr.min.js" type="text/javascript"></script>
  <script>
  	var slideIndex = 0;
  	showSlides();
	
	function showSlides() {
	var i;
	var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	for (i = 0; i < slides.length; i++) {
	slides[i].style.display = "none";  
	}
	slideIndex++;
	if (slideIndex > slides.length) {slideIndex = 1}    
	for (i = 0; i < dots.length; i++) {
	dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[slideIndex-1].style.display = "block";  
	dots[slideIndex-1].className += " active";
	setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
  </script>
  <style>
	body{font-family: 'Jeju Gothic', sans-serif; animation:background-changer 5s infinite;}
	.mySlides {display: none;}
	img {vertical-align: middle;}

	/* Slideshow container */
	.slideshow-container {
	  max-width: 1000px;
	  position: relative;
	  margin: auto;
	}

	/* Caption text */
	.text {
	  color: #000000;
	  font-size: 15px;
	  padding: 8px 12px;
	  position: absolute;
	  bottom: 8px;
	  width: 100%;
	  text-align: center;
	}

	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}

	/* The dots/bullets/indicators */
	.dot {
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}

	.active {
	  background-color: #717171;
	}

	/* Fading animation */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
	}

	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}

	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}

	/* On smaller screens, decrease text size */
	@media only screen and (max-width: 300px) {
	  .text {font-size: 11px}
	}
  </style>
</head>  
<body>   
	<div class="jumbotron">
		<div class="container" class="slideshow-container">	
			<div class="mySlides fade">
  				<div class="numbertext">1 / 3</div>
  				<img src="${contextPath}/resources/boardImage/1.jpg" style="width:100%">
 				<div class="text">
 					<h1 class="text-black" align="center">메인입니다.</h1>
					<input type="text" value="">
					<input type="submit" value="검색">
 				</div>
			</div>
			<div class="mySlides fade">
  				<div class="numbertext">2 / 3</div>
  				<img src="${contextPath}/resources/boardImage/2.jpg" style="width:100%">
  				<div class="text">
  					<h1 class="text-black" align="center">메인입니다.</h1>
					<input type="text" value="">
					<input type="submit" value="검색">
  				</div>
			</div>
			<div class="mySlides fade">
  				<div class="numbertext">3 / 3</div>
  				<img src="${contextPath}/resources/boardImage/13jpg" style="width:100%">
  				<div class="text">
  					<h1 class="text-black" align="center">메인입니다.</h1>
					<input type="text" value="">
					<input type="submit" value="검색">
  				</div>
			</div>
		</div>
		<br>
		<div style="text-align:center">
  		<span class="dot"></span> 
  		<span class="dot"></span> 
  		<span class="dot"></span> 
		</div>	
	</div> 
</body>   
</html>
