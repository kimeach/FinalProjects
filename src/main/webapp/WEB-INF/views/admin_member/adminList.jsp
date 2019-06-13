<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">

<div class="jumbotron">
		<div class="container">
			<h1>관리자리스트</h1>
		</div>
	</div>
	
	
	
<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>비밀번호 확인</b></td>
      <td><b>이름</b></td>
      <td><b>가입일</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="adminMember" items="${adminList}" >     
   <tr align="center">
     <td><a href="${contextPath}/Admin/adminUpdateForm.do?id=${adminMember.id }">${adminMember.id}</a></td>
      <td>${adminMember.pwd}</td>
      <td>${adminMember.pwd_confirm}</td>
      <td>${adminMember.name}</td>
      <td>${adminMember.joinDate}</td>
      <td><a href="${contextPath}/Admin/adminRemove.do?id=${adminMember.id }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/Admin/adminAuthForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
