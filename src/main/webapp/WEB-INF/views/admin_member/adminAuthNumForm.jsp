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
<meta charset="UTF-8">
<title>회원 가입창</title>

<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script type="text/javascript">
	function checkForm() {
	 	if (!document.newMember.adminAuth.value) {
			alert("고유번호를 입력하세요.");
			return false;
		}else if(document.newMember.adminAuth.value!="adminNum165898"){
			alert("고유번호가 틀렸습니다.");
		return false;
		}
	}
	
</script>
<title>회원 가입</title>
</head>
<body style="font-family: jejugothic ">
	
	<div class="jumbotron">
		<div class="container">
			<h1>관리자 모드</h1>
		</div>
	</div>

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="${contextPath}/Admin/adminAuthNum2Form.do" method="post" onsubmit="return checkForm()">
			
			
			<div class="form-group  row">
				<label class="col-sm-2">admin고유번호</label>
				<div class="col-sm-3">
					<input name="adminAuth" type="text" class="form-control" placeholder="adminAuth" >
				</div>
			</div>
			
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>