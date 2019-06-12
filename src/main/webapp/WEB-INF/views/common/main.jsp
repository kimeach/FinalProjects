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
  
</head>  

<body>   
		<div class="jumbotron bg-white"
		style="height:40%; width:50%
		background-image: url('${contextPath}/resources/boardImage/bg4.jpg');
		background-attachment: fixed;
		padding: 20%;"
		>
		<div class="container"  >
		<h1 class="text-black" align="center">메인입니다.</h1>
		<input type="text" value="">
		<input type="submit" value="검색">
</div>
</div> 

</body>   
</html>
