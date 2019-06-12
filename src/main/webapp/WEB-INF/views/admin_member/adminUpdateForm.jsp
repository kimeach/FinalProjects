<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body style="font-family: jejugothic ">

<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 정보 수정</h1>
		</div>
	</div>
	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="${contextPath}/Admin/adminFix.do" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control"  value="${adminVO.id}" readonly >
				</div>
			</div>

	<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"  value="${adminVO.name}" >
				</div>
			</div>


			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="pwd" type="text" class="form-control" placeholder="password" value="${generVO.pwd}" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="password_confirm" >
				</div>
			</div>
		 
			
		
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3 ">
					<input type="submit" class="btn btn-info" value="수정하기">
					<input type="reset" class="btn btn-info" value="다시입력">
				</div>
			</div>
			

		</form>	
	</div>

</body>
</html>