<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>후기/평점</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
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
	function fn_remove_review(url, reviewNO){
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
	    var reviewNOInput = document.createElement("input");
	    reviewNOInput.setAttribute("type","hidden");
	    reviewNOInput.setAttribute("name","reviewNO");
	    reviewNOInput.setAttribute("value", reviewNO);
		 
	    form.appendChild(reviewNOInput);
	    document.body.appendChild(form);
	    
	    var isDel = confirm("삭제하시겠습니까?");
	    if(isDel) form.submit();
	    else return;
	}
</script>
<style>
	.np{font-family: 'Jeju Gothic', sans-serif;}
</style>
<body>
	<div class="container" align="center" style="margin-left:30%">
		<form name="frmReview" method="POST" action="${contextPath}" enctype="multipart/form-data">
				<p class="np" style="margin-left:90%;">
					<input type="button" value="후기 작성" onclick="javascript:location.href='${contextPath}/review/reviewForm.do';" class="btn btn-secondary" >
				</p>
			<c:choose>
				<c:when test="${reviewList==null}">
					<div class="row">				
						<p align="center" class="np">
           	 				<b><span style="font-size:9pt;">등록된 후기가 없습니다.</span></b>
        				</p>
        			</div>	
				</c:when>
				<c:when test="${reviewList!=null}">
				<div class="row">
					<c:forEach var="review" items="${reviewList}" varStatus="reviewNum">
						<div class="col-md-5" style="border-style:solid; 
							border-color:gray; margin:5px; width:20%; height:30%">
							<c:choose>
								<c:when test="${not empty review.imageFileName && review.imageFileName!='null'}">
										<img src="${contextPath}/download.do?reviewNO=${review.reviewNO}&imageFileName=${review.imageFileName}"
											id="preview" style="width:100%; height:40%;"/>			
								</c:when>
							</c:choose>
							<hr>
							<h5><strong><a href="${contextPath}/review/viewReview.do?reviewNO=${review.reviewNO}">
								<p class="np" style="font-size:30px">${review.name}<p></a></strong>
							</h5>
							<div style="text-align:left">
								<p class="np" style="font-size:15px; text-align:left;">${review.zipcode}<br>
								<p class="np" style="font-size:15px; text-align:left;">${review.address}<br>
								<p class="np" style="color:gray;font-size:12px; text-align:left;">이용 후기 평점 : ${review.point}</p>
								<p class="np" style="font-size:15px; text-align:left;">
									<img src="${contextPath}/resources/image/review_repo/like.png" style="width:14px; height:15px">${review.love}<br>
								</p>
								<p class="np" style="font-size:15px; text-align:left;">
									<img src="${contextPath}/resources/image/review_repo/dislike.png" style="width:12px; height:12px">${review.dislove}<br>
								</p>
								<p class="np" style="color:gray;font-size:12px; text-align:left;">
									&nbsp;&nbsp;후기 작성일: ${review.writeDate}
								</p>	
								<p class="np" style="color:gray;font-size:13px; text-align:left;">
									<img src="${contextPath}/resources/image/PeopleIcon.jpeg"
										style="width:20px; height:20px;">
									<a href="#">${review.id}</a>
								</p>
							</div>
							<p class="np">
								<input type=button value="수정" 
									onClick="javascript:location.href='${contextPath}/review/viewReview.do?reviewNO=${review.reviewNO}';" class="btn btn-default" >
								<input type=button value="삭제하기" 
									onClick="fn_remove_review('${contextPath}/review/removeReview.do', ${review.reviewNO})" class="btn btn-default" >
							</p>
						</div>
					</c:forEach>
				</div>
				</c:when>
			</c:choose>
		</form>	
	</div>
</body>
</html>