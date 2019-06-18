<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"   isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<style>
	  body{font-family: 'Jeju Gothic', sans-serif;}
	</style>
  
<meta charset="UTF-8">
<title>글쓰기</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
    	  }
  	}  
	
	function backToList(obj){
    obj.action="${contextPath}/board/listPaging.do";
    obj.submit();
  	}  
	
	var cnt=1;
 	function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }    	
 	
	function openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				//$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
			}
		}).open();
	}
/* 
 	$('document').ready(function() {
 	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
 	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
 	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
 	   var area3 = ["대덕구","동구","서구","유성구","중구"];
 	   var area4 = ["광산구","남구","동구", "북구","서구"];
 	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
 	   var area6 = ["남구","동구","북구","중구","울주군"];
 	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
 	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
 	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
 	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
 	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
 	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
 	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
 	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
 	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
 	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
 
 	 // 시/도 선택 박스 초기화
 	 $("select[name^=sido]").each(function() {
 	  $selsido = $(this);
 	  $.each(eval(area0), function() {
 	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
 	  });
 	  $selsido.next().append("<option value=''>구/군 선택</option>");
 	 });	 

 	 // 시/도 선택시 구/군 설정
 	 $("select[name^=sido]").change(function() {
 	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
 	  var $gugun = $(this).next(); // 선택영역 군구 객체
 	  $("option",$gugun).remove(); // 구군 초기화

 	  if(area == "area0")
 	   $gugun.append("<option value=''>구/군 선택</option>");
 	  else {
 	   $.each(eval(area), function() {
 	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
 	   });
 	  }
 	 }); 	 
	}); 	
  */	
 	</script>
</head>

<h2>　</h2>
<body>
	<form name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do" enctype="multipart/form-data">
	    <table align="center">
			<tr height="15">
	    		<td colspan="5" align="center" /> 
			</tr>	
	      <tr>
			<td width="150" align="center">작　성　자</td>
			<td colspan=2  align="left">
				<c:choose>
				    <c:when test="${not empty member.id && member.id!='null'}">
				        <input type="text" size="67" maxlength="100"  value="${member.id}" name="id" disabled/>
						<input type="hidden" size="67" maxlength="100"  value="${member.id}" name="id"/>
				    </c:when>
				    <c:otherwise>
				       <input type="text" size="67" maxlength="100"  value="${comMember.name}" name="id" disabled/>
						<input type="hidden" size="67" maxlength="100"  value="${comMember.name}" name="id"/>
				    </c:otherwise>
				</c:choose>			
			</td> <!-- readonly는 값 넘어감, disabled는 X -->			
		</tr>
		<tr>
			<td width="150" align="center">지　　　역</td>
			<td colspan="2" align="left">
<!-- 				<select name="sido" id="sido"></select>
				<select name="gugun" id="gugun"></select> -->
						<input type="text"  size="55" maxlength="100" name="address"/>
						<input type="button" class="btn btn-primary"  onclick="openZipSearch()" value="지역 찾기"/>
			</td>
		</tr>
		<tr>
			<td width="150" align="center">제　　　목</td>
			<td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top"><br>내　　　용</td>
			<td colspan="2">
				<textarea name="content" rows="20" cols="65" maxlength="4000" style="resize:vertical;"></textarea>
			</td>
	     </tr>
		  <tr>
			<td align="right">　</td>
		  </tr>
		  <tr>
		      <td colspan="5" align="right"> 
			       <input type="submit" value="글쓰기" />
			       <input type="button" value="목록" onClick="backToList(this.form)" />
		      </td>
	     </tr>
	    <tr height="73">
	    	<td colspan="5" align="center" /> 
	    </tr>	
	   </table>
	</form>
</body>
</html>
