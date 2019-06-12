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
</head>
<body>
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
     <td><a href="${contextPath}/General/generUpdateForm.do?id=${generMember.id }">${generMember.id}</a></td>
      <td>${generMember.pwd}</td>
      <td>${generMember.pwd_confirm}</td>
      <td>${generMember.name}</td>
      <td>${generMember.email}</td>
      <td>${generMember.email2}</td>
      <td>${generMember.joinDate}</td>
      <td><a href="${contextPath}/General/generRemove.do?id=${generMember.id }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/General/generForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
