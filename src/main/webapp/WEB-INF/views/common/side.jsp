<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8"> 
  <title>사이드 메뉴</title>
    <script type="text/javascript">
  function delete(){
	  alert("정말 탈퇴하시겠습니까?");
	  location.href="${contextPath}/General/generRemove.do?id= ${id}"
  }
  
  </script>
</head>
<body>
	
	<h3>
		<a href="${contextPath}/General/generForm.do"  class="no-underline">내정보 수정</a><br>
		<a href="javascript:void(0);" onclick="delete();" >회원탈퇴</a>
	</h3>
	
</body>
</html>