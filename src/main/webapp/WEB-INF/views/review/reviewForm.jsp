<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function readURL(input){
		if(input.files && input.files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />'");
		cnt++;
	}
</script>
<script>
	function openZipSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
			}
		}).open();
	}
</script>
<style>
	.np{font-family: 'Jeju Gothic', sans-serif;}
</style>
<body>
	<form name="reviewForm" method="POST" action="${contextPath}/review/addNewReview.do" 
			enctype="multipart/form-data" class="form-horizontal">
		<div class="container" style="margin-left:35%">		
			<div>
				<img  id="preview" src="#" width=100px height=100px />
			</div>		
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">IMAGEFILE</p></label>
				<div class="col-sm-3">	
					<input type="file" name="imageFileName" id="np" onchange="readURL(this);"  class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">STORE</p></label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="OO부동산" maxlength="30" name="name" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">ZIPCODE</p></label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="11111" maxlength="30" name="zipcode" />
				</div>
				<p class="np">
					<input type="button" class="btn btn-primary"  onclick="openZipSearch()" value="우편번호 찾기">
				</p>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">ADDRESS</p></label>
				<div class="col-sm-3">
					<input type="text"  class="form-control" placeholder="Address" maxlength="30" name="address" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">POINT</p></label>
				<div class="col-sm-3">
					<select name="point">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10" selected>10</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">LOVE</p></label>
				<div class="col-sm-3">	
					<textarea name="love" placeholder="장점" rows="10" cols="30" maxlength="30"></textarea>
				</div>	
				<label class="col-sm-2"><p class="np">DISLOVE</p></label>
				<div class="col-sm-3">	
					<textarea name="dislove" placeholder="단점" rows="10" cols="30" maxlength="30"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">REGDATE</p></label>
				<div class="col-sm-3">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
					<input type="text" name="writeDate" value="<c:out value='${today}' />" readonly />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">NAME</p></label>
				<div class="col-sm-3">
					<input type="text" placeholder="작성자" name="id" />
				</div>
			</div>	 
		</div>
		<p class="np" style="margin-left:35%">
			<input type="submit" class="btn btn-default" value="후기 등록" />
			<input type="button" class="btn btn-default" value="후기 목록" onclick="javascript:location.href='${contextPath}/review/reviewList.do';" />		
		</p>
	</form>
</body>
</html>