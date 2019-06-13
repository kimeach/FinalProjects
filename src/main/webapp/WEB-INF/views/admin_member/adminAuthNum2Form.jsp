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
<title>회원가입</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script type="text/javascript">
function gen(){
	location.href="${contextPath}/Admin/adminForm.do";
}
function com(){
	location.href="${contextPath}/Admin/loginForm.do";
}

</script>

</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">


<div class="jumbotron">
		<div class="container">
			<h1>관리자 모드</h1>
		</div>
	</div>
                <div class="col-sm-3">
					<input name="Gener" type="button" 
					              class="form-control btn btn-success" value="관리자등록" onclick="gen()">
				</div>
				
				<div class="col-sm-3">
					<input name="Com" type="button" 
					              class="form-control btn btn-success" value="관리자 로그인" onclick="com()">
				</div>
</body>
</html>