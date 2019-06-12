<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8"); %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<c:set var="path" value="${pageContext.request.contextPath}">
</c:set>
<meta charset="utf-8">
<title>매물 보여주기</title>

<style>
body{
font-family: 'Jeju Gothic', sans-serif;
}
</style>
</head>
<script src="${path}/resources/jquery.js"></script>
<body>
	<div class="container" style="padding-left: 10%">
	<div class=""><h5>
	</h5>
	</div>
	<h1>
	<b>중개사무소 찾기</b>
	</h1>
		<b><a href="${path}/item/ItemInsert.do?authNum=${authNum}" style="color: black;
	  margin: 0 0 0 60%;">매물등록</a></b>
	<br>
<form action="${path}/member/CompanyMemberView.do?pg=1" method="post">
<table class="table" style="width: 80%;">
	<tr>
	<td><select class="" name="searchSelect" style="width: 20%; height: 40px;">
	<option value="searchAll">전체</option>
	<option value="search1">이름</option>
	<option value="search2">지역</option>
	
	</select> <input type="text" name="searchKeyWord" style="width: 67%; height: 40px;" 
	placeholder="지역명 또는 이름을 입력하세요."> 
	<input type="submit" class="btn btn-primary" style="width: 10%; height: 40px;"
	value="검색"></td>
	</tr>
</table>
<!-- 검색결과 -->
</form>
<c:if test="${not empty search}">
<h4> "<span style="color:red;font-weight: bold;">${search}</span>" 에 대한 <span style="color:red;font-weight: bold;"> ${pageCount} </span>건의 중개사무소 검색결과 입니다.</p></h4>
</c:if>
<!-- 결과 -->
<c:if test="${empty list}">
<table class="table table-hover text-center" style="width: 80%;">
<tr><th><div style="text-align: center">검색 결과가 없습니다.</div></th></tr>
</table>
</c:if>

<c:if test="${not empty list}">
<!-- 검색결과 or 중개사무소 리스트 -->
	<c:forEach var="item" items="${list}">
	<table class="table table-hover" style="width: 80%">
	<tr><td rowspan="4" style="width: 30%;">${item.authNum} 사진 </td></tr>
	<tr><td style="width: 70%;">${item.name}</td></tr>
	<tr><td style="width: 70%;">${item.address}</td></tr>
	<tr><td style="width: 70%;"><span>보유 매물 (매: 0 / 전: 0 /월 :0)</span> 
	<span style="margin: 0 0 0 40%"></span> <input type="button"
	class="btn btn-primary" value="매물 보기"
	onclick="javascript:location.href='${path}/item/ItemSelect.do?authNum=${item.authNum}&pg=1';"></td>
	</tr>
	</table>
	</c:forEach>
	</c:if>
	</div>
	<!-- 페이지네이션 -->
	<div class="text-center ">
	<!-- 검색전 -->
	<ul class="pagination">
	<c:if test="${pg>0}">
	<li><a href="${path}/member/CompanyMemberView.do?pg=${pg-1}">이전</a></li>
	</c:if>
	<c:if test="${pg<=0}">
	<script>
	alert("첫번째 페이지입니다.");
	location.href="${path}/member/CompanyMemberView.do?pg=1";
	</script>
	</c:if>
	<c:forEach var="count" begin="1" end="${pageNum}">
	<li><a href="${path}/member/CompanyMemberView.do?pg=${count}">${count}</a></li>
	</c:forEach>
	<c:if test="${pg<=pageNum}">
	<li><a href="${path}/member/CompanyMemberView.do?pg=${pg+1}">다음</a></li>
	</c:if>
	<c:if test="${pg>pageNum}">
	<script>
	alert("마지막장입니다.");
	location.href="${path}/member/CompanyMemberView.do?pg=${pg-1}";
	</script>
	</c:if>
	</ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
