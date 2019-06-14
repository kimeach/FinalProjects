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
	            <a href="${contextPath}/main/main.do"><small>메인</small></a>
	            <a href="${contextPath}/board/listPaging.do"><small>의뢰게시판</small></a>
	            <a href="${contextPath}/member/CompanyMemberView.do?pg=1"><small>중개사무소찾기</small></a>
	            <a href="${contextPath}/review/reviewList.do"><small>후기</small></a>
	</div>
	<p>　</p>
</body>
</html>