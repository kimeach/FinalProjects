<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body style="font-family: jejugothic ">

<div class="jumbotron">
		<div class="container">
			<h1>관리자 인증</h1>
			<h5>관리자 인증코드를 입력해주세요</h5>
		</div>
	</div>

	<div class="container" >
		<form name="newMember" class="form-horizontal"  action="${contextPath}/Admin/adminForm.do" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">인증번호</label>
				<div class="col-sm-3">
					<input name="auth" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>

</body>
</html>