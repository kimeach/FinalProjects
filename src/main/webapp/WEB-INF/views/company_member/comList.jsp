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
<body style="font-family: jejugothic ">

<div class="jumbotron">
		<div class="container">
			<h1>사업자 리스트</h1>
		</div>
	</div>



<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td><b>인증번호</b></td>
      <td ><b>이미지</b></td>
      <td ><b>우편번호</b></td>
      <td ><b>주소</b></td>
      <td><b>대표자 성명</b></td>
      <td><b>번호1</b></td>
      <td><b>번호2</b></td>
      <td><b>번호3</b></td>
      <td><b>이메일</b></td>
      <td><b>이메일2</b></td>
      <td><b>주요매물</b></td>
      <td><b>가입날짜</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="comMember" items="${comList}" >     
   <tr align="center">
     <td><a href="${contextPath}/Company/comUpdateForm.do?authNum=${comMember.authNum}">${comMember.authNum}</a></td> 
     <td>${comMember.imageFile}</td>
     <td>${comMember.zipCode}</td>
      <td>${comMember.address}</td>
      <td>${comMember.name}</td>
      <td>${comMember.phone1}</td>
      <td>${comMember.phone2}</td>
      <td>${comMember.phone3}</td>
      <td>${comMember.email}</td>
      <td>${comMember.email2}</td>
      <td>${comMember.mainDeal}</td>
      <td>${comMember.joinDate}</td>
      <td><a href="${contextPath}/Company/comRemove.do?authNum=${comMember.authNum }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/Company/comMemberForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
