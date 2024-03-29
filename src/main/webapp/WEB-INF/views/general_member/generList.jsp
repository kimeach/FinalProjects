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
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">

<div class="jumbotron">
		<div class="container">
			<h1>회원 리스트</h1>
		</div>
	</div>

<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>비밀번호 확인</b></td>
      <td><b>이름</b></td>
      <td><b>이메일</b></td>
      <td><b>이메일2</b></td>
      <td><b>가입일</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="generMember" items="${generList}" >     
   <tr align="center">
      <td>${generMember.id}</td>
      <td>${generMember.pwd}</td>
      <td>${generMember.pwd_confirm}</td>
      <td>${generMember.name}</td>
      <td>${generMember.email}</td>
      <td>${generMember.email2}</td>
      <td>${generMember.joinDate}</td>
      <td><a href="${contextPath}/General/generRemove.do?id=${generMember.id }">강퇴</a></td>
    </tr>
  </c:forEach>   
</table>
</body>
</html>
