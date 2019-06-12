<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
</head>
<%String sessionId=(String)session.getAttribute("sessionId");%>

<body>

<div align="right">
   <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <small>환영합니다. ${member.name}님!</small>
            <a href="${contextPath}/General/logout.do"><small>로그아웃</small></a>
            <a href="${contextPath}/General/mypage.do"><small>마이페이지</small></a>
          </c:when>
   <c:otherwise>
	        <a href="${contextPath}/login.do"><small>로그인</small></a>
	        <a href="${contextPath}/AddMember.do"><small>회원가입</small></a>
	        <a href="${contextPath}/Admin/adminAuthNumForm.do"><small>관리자</small></a>
	      </c:otherwise>
	   </c:choose>     
          <c:choose>
          <c:when test="${isLogOn == true  && comMember!= null}">
            <small>환영합니다. ${comMember.name}님!</small>
            <a href="${contextPath}/Company/logout.do"><small>로그아웃</small></a>
            <a href="${contextPath}/Company/mypage.do"><small>마이페이지</small></a>
          </c:when>
          </c:choose>
         <c:choose>
          <c:when test="${isLogOn == true  && admember!= null}">
            <small>환영합니다. ${admember.name}님!</small>
            <a href="${contextPath}/Admin/logout.do"><small>로그아웃</small></a>
            <a href="${contextPath}/Admin/mypage.do"><small>마이페이지</small></a>
          </c:when>
	   </c:choose>     
	   
</div>



</body>
</html>