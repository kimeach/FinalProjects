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
<%-- <table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>이름</b></td>
      <td><b>이메일</b></td>
      <td><b>가입일</b></td>
      <td><b>탈퇴</b></td>
   </tr>
   
 
   <tr align="center">
      <td><a href="${contextPath}/member/modMemberForm.do?id=${member.id }">${member.id}</td>
      <td>${member.pwd}</td>
      <td>${member.name}</td>
      <td>${member.email}</td>
      <td>${member.joinDate}</td>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.id }">탈퇴하기</td>
    </tr>
     <img alt="회원정보수정" src="${contextPath }/resources/img/mod.png" width="120" height="120">
  <img alt="마이페이지" src="${contextPath }/resources/img/mypage.png" width="100" height="100">
 
  <img alt="회원탈퇴" src="${contextPath }/resources/img/delete3.png" width="100" height="100">
</table> --%>







<label>
<figure><a href="${contextPath}/Company/comList.do">
<img alt="기업리스트" src="${contextPath }/resources/img/company.png" width="100" height="100">
<figcaption>기업리스트</figcaption>
</figure></a>
</label>

<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>

<label>
<figure><a href="${contextPath}/General/generList.do">
 <img alt="일반회원리스트" src="${contextPath }/resources/img/mypage.png" width="100" height="100" >
<figcaption>일반리스트</figcaption>
  </figure></a>
  </label>



</body>
</html>
