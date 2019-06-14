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
			  { src: '${contextPath}/resources/boardImage/11.jpg' },
			  { src: '${contextPath}/resources/boardImage/22.jpg' },
			  { src: '${contextPath}/resources/boardImage/33.jpg' },
			  { src: '${contextPath}/resources/boardImage/44.jpg' }
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
 	    <div style="background-color:none;">	    	
	    	<table align="center" width="100%"
	    		height="100%" style="display:block;"  >
	    		<tr></tr>
	    		<tr></tr>
	    		<tr height="700" align="center"  class="content">
     				<h1 class="text-black" align="center">집을 찾을 때는, 중개나라</h1></td>  
  					<input type="text" value="">
					<input type="submit" value="검색">
  				</tr>
  			</table>	
	      </div>
 	 </div>
</body>   
</html>
