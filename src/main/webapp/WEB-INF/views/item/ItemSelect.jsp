<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>매물 조회하기</title>
<style>
body{
font-family: 'Jeju Gothic', sans-serif;
}
a {
	color: black;
}
</style>
</head>
<body>
	<div class="container" style="padding-left: 10%;">
		<h1>매물 조회</h1>
		<div style="padding-left:60%;"> <a href="${path}/item/ItemInsert.do?authNum=${authNum}"><b>매물 등록</b></a><span style="padding-left:5%;"></span> 
		<a href="${path}/member/CompanyMemberView.do?pg=1"> <b>중개사무소 찾기</b> </a> </div>
		<div class="search">
			<form action = "${path}/item/ItemSelect.do?authNum=${authNum}&pg=${pg}" method ="post">
			<table class="table" style="width: 80%">
				<tr>
					<td><span style="margin-right: 3%">거래종류 :</span> 
					<select class="" name="Itemselect" style="width: 100px">
							<option value="all">전체</option>
							<option value="search1">매매</option>
							<option value="search2">전세</option>
							<option value="search3">월세</option>
					</select> <br> <span style="margin-right: 7%"> 주소 : </span> 
					<input type="text" placeholder="주소를 입력해주세요." name="addr" required="required"><br>
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
						<span style="margin-right: 7%"> 가격 : </span> 
						<input type="text" name="minPrice" value="1" style="width: 60px" required="required"> 만원 ~ 
						<input type="text" name="maxPrice" value="" style="width: 60px" required="required"> 만원
					<td rowspan="2" colspan="2"><input type="submit" name=""class="btn btn-primary" value="검색"
						style="width: 100px; height: 50px; margin: 5% 0 0 35%;"></td>
				</tr>
			</table>
			</form>
		</div>
		<c:forEach items="${list}" var="item">
		<table class="table table-hover" style="width: 80%">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="${path}/item/ItemView.do?authNum=${item.authNum}&autoNum=${item.autoNum}">${item.autoNum}  사진</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="${path}/item/ItemView.do?authNum=${item.authNum}&autoNum=${item.autoNum}">[${item.itemSelect}] ${item.loadMap}</a></td>
			</tr>
			<tr>
				<td style="width: 70%;"><a href="${path}/item/ItemView.do?authNum=${item.authNum}&autoNum=${item.autoNum}">${item.itemAddr} , ${item.itemLayer} 층 / ${item.total_Layer} 층 |
						면적 : ${item.itemWidth}㎡</a></td>
			</tr>
		</table>
	</c:forEach>

	</div>
	<!-- 페이지네이션 -->
	<div class="text-center ">
	<!-- 검색전 -->
	<ul class="pagination">
	<c:if test="${pg>0}">
	<li><a href="${path}/item/ItemSelect.do?authNum=${authNum}&pg=${pg-1}">이전</a></li>
	</c:if>
	<c:if test="${pg<=0}">
	<script>
	alert("첫번째 페이지입니다.");
	location.href="${path}/item/ItemSelect.do?authNum=${authNum}&pg=1";
	</script>
	</c:if>
	<c:forEach var="count" begin="1" end="${pageNum}">
	<li><a href="${path}/item/ItemSelect.do?authNum=${authNum}&pg=${count}">${count}</a></li>
	</c:forEach>
	<c:if test="${pg<=pageNum}">
	<li><a href="${path}/item/ItemSelect.do?authNum=${authNum}&pg=${pg+1}">다음</a></li>
	</c:if>
	<c:if test="${pg>pageNum}">
	<script>
	alert("마지막장입니다.");
	location.href="${path}/item/ItemSelect.do?authNum=${authNum}&pg=${pg-1}";
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
