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
