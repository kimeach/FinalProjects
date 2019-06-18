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
	location.href="${contextPath}/General/generForm.do";
}
function com(){
	location.href="${contextPath}/Company/comMemberForm.do";
}

</script>

</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">


<div class="jumbotron">
		<div class="container" >
			<h1>회원가입</h1>
		</div>
	</div>
				<p size="20px">　</p>
                <div class="col-sm-3">
					<input name="Gener" type="button" 
					              class="form-control btn btn-success" value="일반회원가입" onclick="gen()">
				</div>
				<p size="20px">　</p>
				<div class="col-sm-3">
					<input name="Com" type="button" 
					              class="form-control btn btn-success" value="중개소등록" onclick="com()">
				</div>
				<p size="20px">　</p>
</body>
</html>