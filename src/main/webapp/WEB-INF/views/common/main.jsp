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
  <script>
  	$(document).ready(function(){
   		 $('.backgroundTransition').backgroundTransition({
		  backgrounds:[
			  { src: '${contextPath}/resources/boardImage/bg4.jpg' },
			  { src: '${contextPath}/resources/reviewImage/like.png' },
			  { src: '${contextPath}/resources/reviewImage/dislike.png' }
		  ],
		  transitionDelay: 3,
		  animationSpeed: 800
	  	});
  	});
  </script>
  <style>
	body{font-family: 'Jeju Gothic', sans-serif; animation:background-changer 5s infinite;}
  </style>
</head>  
<body> 
	<div class="backgroundTransition">
	    <div class="content">	    	
	    	<table align="center" border="1"  width="100%" 
	    		height="100%" style="display:block;"  >
	    		<tr height="200" align="center" >
     				<td ><h1 class="text-black" align="center">메인입니다.</h1></td>  
  				</tr>
  				<tr>
  					<td>
  						<input type="text" value="">
						<input type="submit" value="검색">
					</td>
  				</tr>
 	 			<tr height="200" align="center" >
  					<td>　</td>
  				</tr>
  			</table>	
	<!--     	
	  			<h1 class="text-black" align="center">메인입니다.</h1>
				<input type="text" value="">
				<input type="submit" value="검색"> -->
	     </div>
	</div>
</body>   
</html>
