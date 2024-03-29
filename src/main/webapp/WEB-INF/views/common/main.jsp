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
  <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
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
		  transitionDelay: 5,
		  animationSpeed: 800
	  	});
  	});
  </script>
  <style>
	body{font-family: 'Jeju Gothic', sans-serif; animation:background-changer 5s infinite;}
  </style>
</head>  
<body> 	    
	<form action="${contextPath}/main/mainSearch.do?pg=1&mainSearch=mainSearch" method="post">
	<table align="bottom" style="display:block; background-color:rgba(255,255,255,0.3)"
		height="100%" width="100%" class="backgroundTransition">
	    	<thead></thead>
	    	<tbody>
	    		<tr><td></td><td></td><td></td></tr>
	    		<tr height="700">
	    			<td></td>
	    			<td  height="1000" align="center" style="position:absolute; left:30%; top:40%;">
     		<!-- 			<h1 class="text-black" align="center" 
     					style="font-family: 'Nanum Pen Script', cursive;font-size: 3em;" >내가 찾는, 우리집</h1>   -->
     					<h1 class="text-black" align="center" 
     					style="font-size: 2em;" >내가 찾는, 우리집</h1> 
  						<input type="text" value="" name="keyword" style="width:600px;height:30px;">
						<input type="submit" value="검색" class="btn btn-danger btn-large">
					</td>
					<td></td>	
  				</tr>
  				<tr><td></td><td></td><td></td></tr>
	    	</tbody>
	    	<tfoot></tfoot>
	</table>	
	</form>
</body>   
</html>
