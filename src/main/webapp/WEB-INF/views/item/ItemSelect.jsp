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
.search {	color: black;	}
</style>
</head>
<body>
		<h1>매물 조회</h1>
		
		<c:if test="${empty mainSearch}">
		<div style="padding-left:50%;">
		<c:if test="${authNumId eq authNum}">
		<a href="${path}/item/ItemInsert.do?authNum=${authNumId}"><b>매물 등록</b></a>
		</c:if>
		<span style="padding-left:5%;"></span> 
		<a href="${path}/member/CompanyMemberView.do?pg=1"> <b>중개사무소 찾기</b> </a> 
		</div>
		</c:if>
		<c:if test="${not empty mainSearch}">
		<div style="padding-left:35%;">
		<a href="${path}/member/CompanyMemberView.do?pg=1"> <b>중개사무소 찾기</b> </a> 
		</div>
		</c:if>
		
		
		<div class="search">
		
		<c:if test="${empty mainSearch}">		
		<form action = "${path}/item/ItemSelect.do?authNum=${authNum}&pg=${pg}" method ="post">
		<table class="table" style="width: 60%;text-align:left;margin-left:20%;">
		<tr>
		<td><span style="padding-right:3%">거래종류 : </span>
		<select class="" name="Itemselect" style="width: 100px">
		<option value="all">전체</option>
		<option value="search1">매매</option>
		<option value="search2">전세</option>
		<option value="search3">월세</option>
		</select> <br> <span style="margin-right: 7%"> 주소 : </span> 
		<input type="text" placeholder="주소를 입력해주세요." name="addr"><br>
		<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
		<span style="margin-right: 7%"> 가격 : </span> 
		<input type="text" name="minPrice" value="1" style="width: 60px" required="required"> 만원 ~ 
		<input type="text" name="maxPrice" value="1000" style="width: 60px" required="required"> 만원
		<td rowspan="2" colspan="2"><input type="submit" name=""class="btn btn-primary" value="검색"
		style="width: 100px; height: 50px; margin: 5% 0 0 50%;"></td>
		</tr>
		</table>
		</form>
		</c:if>
		
		<c:if test="${not empty mainSearch}">
		</c:if>
		<hr>
		</div>
		<c:if test="${not empty count && keyword ne null}">
		<h4><b>"<span style="color:red"> ${keyword} </span>" 에 대한 "<span style="color:red">
		${count}</span> "건의 결과가 검색되었습니다.</b></h4>
		</c:if>
		<c:if test="${count eq 0 }">
		<table class="table table-hover" style="width:40%;margin-left:30%;">
		<tr><td colspan="3"><b>검색결과가 없습니다.</b></td></tr>
		</table></c:if>
		
		<c:if test="${count ne 0}">
		<c:forEach items="${list1}" var="item">
		<table class="table table-hover" style="width:40%;margin-left:30%;">
			<tr>
				<td rowspan="3" style="width: 30%;"><a href="${path}/item/ItemView.do?authNum=${item.authNum}&autoNum=${item.autoNum}">
				<img src="${path}/resources/itemImage/${item.picture}" width="200px" height="120px"/></a></td>
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
	<!-- 페이지네이션 -->
	<div class="text-center">
	<!-- 검색전 -->
	<!-- 일반검색 -->
	<c:if test="${empty mainSearch}">
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
	</c:if>
	<!-- 메인에서 검색 -->
	<c:if test="${not empty mainSearch}">
	<ul class="pagination">
	<c:if test="${pg>0}">
	<li><a href='${path}/main/mainSearch.do?pg=${pg-1}&mainSearch=mainSearch'>이전</a></li>
	</c:if>
	<c:if test="${pg<=0}">
	<script>
	alert("첫번째 페이지입니다.");
	location.href="${path}/main/mainSearch.do?&pg=1&mainSearch=mainSearch";
	</script>
	</c:if>
	<c:forEach var="count" begin="1" end="${pageNum}">
	<li><a href="${path}/main/mainSearch.do?pg=${count}&mainSearch=mainSearch">${count}</a></li>
	</c:forEach>
	<c:if test="${pg<=pageNum}">
	<li><a href="${path}/main/mainSearch.do?pg=${pg+1}&mainSearch=mainSearch">다음</a></li>
	</c:if>
	<c:if test="${pg>pageNum}">
	<script>
	alert("마지막장입니다.");
	location.href='${path}/main/mainSearch.do?pg=${pg-1}&mainSearch=mainSearch';
	</script>
	</c:if>
	</ul>
	</c:if>
	</div>
	</c:if>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
