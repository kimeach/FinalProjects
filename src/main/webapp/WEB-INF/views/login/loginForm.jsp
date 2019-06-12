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
<title>로그인창</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">



<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  


<script type="text/javascript">
function check() {
	var check = document.getElementsByName("mem"); //체크박스 name
	 var login1 = document.getElementById("GenerForm"); // 보여질내용
	 var login2 = document.getElementById("ComForm"); // 보여질내용
	 
	 if(check[0].checked == true ){
	 login1.style.display = "";
	 login2.style.display = "none";
	 }else if(check[1].checked =true){
	  login1.style.display = "none";
	  login2.style.display = "";
	 }
	}


</script>

</head>

<body style="font-family: jejugothic ">

<div class="jumbotron">
		<div class="container">
			<h1>회원 로그인</h1>
		</div>
	</div>
	
           <div class="form-group row">
				<div class="col-sm-2">
					<input name="mem" type="radio" class="form-control" 
					                     value="일반회원" onclick="check()" checked="checked">일반회원
					</div>
				
				<div class="col-sm-2">
					<input name="mem" type="radio" class="form-control" 
					                     value="사업자" onclick="check()">중계사무소
					</div>	
		   </div>
		   
		   
		   
<div id="GenerForm">
<form name="frmLogin" method="post"  action="${contextPath}/General/login.do">
  <div class="form-group  row">
				<label class="col-sm-2">id</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="gener_id" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="pwd" type="text" class="form-control" placeholder="pwd" >
					</div>
			</div>
					
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="로그인 " >
				
				</div>
			</div>
</form>
</div>

<div id="ComForm" style="display: none">
<form name="frmLogin" method="post"  action="${contextPath}/Company/login.do">

			
			<div class="form-group  row">
				<label class="col-sm-2">사업자 인증번호</label>
				<div class="col-sm-3">
					<input name="authNum" type="text" class="form-control" placeholder="authNum" >
					</div>
			</div>
					
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="로그인" >
					
				</div>
			</div>
</form>
</div>
</body>
</html>
