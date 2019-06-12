<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>     

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 수정 페이지</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function backToList(obj){
		obj.action="${contextPath}/review/reviewList.do";
		obj.submit();
	}
	function fn_enable(obj){
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("i_name").disabled=false;
		document.getElementById("i_zipcode").disabled=false;
		document.getElementById("i_address").disabled=false;
		document.getElementById("i_address_button").disabled=false;
		document.getElementById("i_point").disabled=false;
		document.getElementById("i_love").disabled=false;
		document.getElementById("i_dislove").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_file_upload").style.display="block";
		document.getElementById("tr_btn").style.display="none";
	}
	function fn_modify_review(obj){
		obj.action="${contextPath}/review/modReview.do";
		obj.submit();
	}
	function readURL(input){
		if(input.files && input.files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
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
	<form name="modReviewForm" method="post" action="${contextPath}" enctype="multipart/form-data">
		<div class="container" style="margin-left:45%;">
				<c:choose>
					<c:when test="${not empty review.imageFileName && review.imageFileName!='null'}">
						<div>
							<input type="hidden" name="originalFileName" value="${review.imageFileName}" />
							<img src="${contextPath}/download.do?reviewNO=${review.reviewNO}&imageFileName=${review.imageFileName}" 
								id="preview" style="width:300px; height:250px" /><br>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><p class="np">IMAGEFILE</p></label>
							<div class="col-sm-3">
								<input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="tr_file_upload">
							<input type="hidden" name="originalFileName" value="${review.imageFileName}" />
						</div>
						<div><img id="preview" /></div>
						<div class="form-group row">
							<label class="col-sm-2"><p class="np">IMAGEFILE</p></label>
							<div class="col-sm-3">
								<input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">review.NO</p></label>
				<div class="col-sm-3">
					<input type="text" value="${review.reviewNO}" disabled />
					<input type="hidden" name="reviewNO" value="${review.reviewNO}" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">STORE</p></label>
				<div class="col-sm-3">
					<input type="text" value="${review.name}" name="name" id="i_name"  disabled />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">ZIPCODE</p></label>
				<div class="col-sm-3">
					<input type="text" value="${review.zipcode}" name="zipcode" id="i_zipcode"  disabled />
				</div>
				<div>
					<input type="button" class="btn btn-primary" onclick="openZipSearch()" 
						id="i_address_button" value="우편번호 찾기" disabled />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">ADDRESS</p></label>
				<div class="col-sm-3">
					<input type="text" value="${review.address}" name="address" id="i_address"  disabled />	
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">POINT</p></label>
				<div class="col-sm-3">
					<select name="point" id="i_point" disabled>
						<option value="1" <c:if test="${review.point==1}">selected='selected'</c:if>>
							1</option>
						<option value="2" <c:if test="${review.point==2}">selected='selected'</c:if>>
							2</option>
						<option value="3" <c:if test="${review.point==3}">selected='selected'</c:if>>
							3</option>
						<option value="4" <c:if test="${review.point==4}">selected='selected'</c:if>>
							4</option>
						<option value="5" <c:if test="${review.point==5}">selected='selected'</c:if>>
							5</option>
						<option value="6" <c:if test="${review.point==6}">selected='selected'</c:if>>
							6</option>
						<option value="7" <c:if test="${review.point==7}">selected='selected'</c:if>>
							7</option>
						<option value="8" <c:if test="${review.point==8}">selected='selected'</c:if>>
							8</option>
						<option value="9" <c:if test="${review.point==9}">selected='selected'</c:if>>
							9</option>
						<option value="10" <c:if test="${review.point==10}">selected='selected'</c:if>>
							10</option>
					</select>
				</div>	
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><p class="np">LOVE</p></label>
				<div class="col-sm-3">
					<input type="text" value="${review.love}" name="love" id="i_love" disabled />
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">DISLOVE</label>
				<div class="col-sm-3">
					<input type="text" value="${review.dislove}" name="dislove" id="i_dislove" disabled />
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2">REGDATE</label>
				<div class="col-sm-3">
					<input type="text" value="${review.writeDate}" name="writeDate" disabled />	
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">NAME</label>
				<div class="col-sm-3">
					<input type="text" value="${review.id}" name="id" disabled />
				</div>	
			</div>
		</div>
		<div id="tr_btn_modify" style="margin-left:40%; margin-bottom:5px;">
			<input type=button value="수정 완료" onclick="fn_modify_review(this.form)" class="btn btn-secondary">
			<input type=button value="수정 취소" onclick="backToList(this.form)" class="btn btn-secondary">
		</div>
		<div id="tr_btn" style="margin-left:40%;">
			<%-- <c:if test="${member.id==review.id}">	
				<input type=button value="후기 변경" onClick="fn_enable(this.form)" class="btn btn-secondary">
				<input type=button value="후기 목록" onClick="backToList(this.form)" class="btn btn-secondary">
			</c:if> --%>
			<input type=button value="후기 변경" onClick="fn_enable(this.form)" class="btn btn-secondary">
			<input type=button value="후기 목록" onClick="backToList(this.form)" class="btn btn-secondary">
		</div>
	</form>
</body>
</html>