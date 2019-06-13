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
	.slidebanner{position:relative;height:100%;width:100%;overflow:hidden;}
	.slidebanner .bannerbox{position:absolute;margin:0;padding:0;}
	.slidebanner li{float:left;list-style:none;margin-left:10px}
	.slidebanner li:first-child{margin:0}
  </style>
</head>  
<body>   
	<div class="jumbotron">
		<div class="container" class="slidebanner"">
			<ul class="bannerbox">	
				<li style="background-image:url('${contextPath}/resources/boardImage/bg1.jpg')">
					<h1 class="text-black" align="center">메인입니다.</h1>
					<input type="text" value="">
					<input type="submit" value="검색">	
				</li>
				<li style="background-image:url('${contextPath}/resources/boardImage/4.jpg')">
					<h1 class="text-black" align="center">메인입니다.</h1>
					<input type="text" value="">
					<input type="submit" value="검색">
				</li>
			</ul>
		</div>
	</div> 
</body>   
</html>
