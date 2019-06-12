<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
<link rel="stylesheet"
	href="${path}/resources/css/style.css?ver=1">
<link rel="stylesheet" href="css/style.css">
<meta charset="utf-8">
<title>매물 등록</title>
<style>
body{
font-family: 'Jeju Gothic', sans-serif;
}
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}
#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}
.bg_white {
	background: #fff;
}
#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}
#menu_wrap .option {
	text-align: center;
}
#menu_wrap .option p {
	margin: 10px 0;
}
#menu_wrap .option button {
	margin-left: 5px;
}
#placesList li {
	list-style: none;
}
#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}
#placesList .item span {
	display: block;
	margin-top: 4px;
}
#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
#placesList .item .info {
	padding: 10px 0 10px 55px;
}
#placesList .info .gray {
	color: #8a8a8a;
}
#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}
#placesList .info .tel {
	color: #009900;
}
#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}
#placesList .item .marker_1 {
	background-position: 0 -10px;
}
#placesList .item .marker_2 {
	background-position: 0 -56px;
}
#placesList .item .marker_3 {
	background-position: 0 -102px
}
#placesList .item .marker_4 {
	background-position: 0 -148px;
}
#placesList .item .marker_5 {
	background-position: 0 -194px;
}
#placesList .item .marker_6 {
	background-position: 0 -240px;
}
#placesList .item .marker_7 {
	background-position: 0 -286px;
}
#placesList .item .marker_8 {
	background-position: 0 -332px;
}
#placesList .item .marker_9 {
	background-position: 0 -378px;
}
#placesList .item .marker_10 {
	background-position: 0 -423px;
}
#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<script src="${path}/resources/jquery.js"></script>
<script>
$(function(){
$("")	
})

</script>

<body>
	<form action="ItemInsertResult.do?authNum=${authNum}" name="frmItem" method="post"
		enctype="multipart/form-data">
		<div class="container" style="padding-left: 10%">
			<!-- 매물 등록화면 -->
			<h1>
				<b>매물등록</b>
			</h1>
			<br>
			<table class="table table-striped" border="1" style="width: 80%">
				<tr>
					<td style="width: 20%;">소재지</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemAddr"></td>
					<td style="width: 20x%;">총 층수</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="total_Layer"> 층</td>
				</tr>
				<h4><b>기본정보</b></h4>
				<tr> 
					<td style="width: 20%;">건물명</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemBuild"></td>
					<td style="width: 20%;">해당 층</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemLayer"> 층</td>
				</tr>
				<tr>
					<td style="width: 20%;">면적</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemWidth">㎥</td>
					<td style="width: 20%;"></td>
					<td style="width: 30%;"></td>
				</tr>
				<tr>
					<td style="width: 20%;">입주 가능일</td>
					<td style="width: 30%;">
					<select name="itemYear"><script>
					for(var i=2019;i<=2030;i++){document.write('<option value='+i+'>'+i+'</option>');}
					</script></select>년 &nbsp;
					<select name="itemMonth"><script>
					for(var i =1;i<=12;i++){document.write('<option value='+i+'>'+i+'</option>');}
					</script></select>월 &nbsp;
					<select name="itemDay"><script>
					for(var i =1;i<=31;i++){document.write('<option '+i+'>'+i+'</option>');}
					</script></select>일 &nbsp;
					</td>
					<td style="width: 20%;"></td>
					<td style="width: 30%;"></td>
				</tr>
				<tr>
					<td style="width: 20%;">주차 가능 대수</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemParking"> 대</td>
					<td style="width: 20%;"></td>
					<td style="width: 30%;"></td>
				</tr>
				<tr>
					<td>관리비</td>
					<td><input type="text" style="width: 80%" name="itemPay"> 만원</td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<h4>
				<b>가격 정보</b>
			</h4>
			<table class="table table-striped" border="1" style="width: 80%">
				<tr>
					<td style="width: 20%;">보증금</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="deposit"> 만원</td>
					<td style="width: 20%;"></td>
					<td style="width: 30%;"></td>
				</tr>

				<tr>
					<td style="width: 20%;"><select name="itemSelect" id=""
						style="height: 30px; width: 50%;">
							<option value="">선택</option>
							<option value="매매">매매</option>
							<option value="전세">전세</option>
							<option value="월세">월세</option>
					</select>&nbsp; 가격</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="itemPrice"> 만원</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td style="width: 20%;">취급업소</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="business"></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td style="width: 20%;">매물 상세 설명</td>
					<td style="width: 30%;"><input type="text" style="width: 80%"
						name="explain"></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<h4>
				<b>사진 정보</b>
			</h4>
			<table class="table table-striped" border="1" style="width: 80%">
				<tr>
					<td style="width: 20%;" class="text-center">사진</td>
					<td style="width: 20%;" class="text-center">지도</td>
				</tr>
				<tr>
					<td style="width: 50%; height: 100px;"><input type="file"
						name="picture" id="picture"></td>
					<td style="width: 50%; height: 100px;"><input type="text"
						id="sample5_address" placeholder="주소" name="loadMap"> <input
						type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						<div id="map"
						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9cc1522c95aa35553841718cfe7fb8d2&libraries=services"></script>
						<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script></td>
				</tr>
			</table>
			<table style="width: 100%">
				<tr>
					<td class="text-center"><input type="submit" value="등록하기"
						class="btn btn-primary btn-lg" style="margin: 0 0 0 -22%">
						<span style="margin: 0 0 0 5%;"> </span> 
						<input type="button" value="취소" onclick="javascript:location.href='../member/CompanyMemberView.do?pg=1';"
						class="btn btn-primary btn-lg"></td>
				</tr>
			</table>
		</div>
	</form>
	<br>
	<br>
	<br>
	<br>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>