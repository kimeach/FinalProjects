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
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	function successIn(){
		alert("가입을 축하드립니다.");
		document.location="${contextPath}/main/main.do"
	}
	
	function mail(){
	
		alert("인증번호를 보냅니다");
		var em=document.getElementById("email").value;
		var em2=document.getElementById("email2");
		var em3=em2.options[em2.selectedIndex].value;
		var email1=em+em3;
		alert(email1);
	
		
		var f=document.createElement("form");
		f.setAttribute("method","get");
		f.setAttribute("action","${contextPath}/mail/mailSending2.do");
		document.body.appendChild(f);
		
		
		
		var inp=document.createElement("input");
		
		inp.setAttribute("type","text");
		inp.setAttribute("name","emailall");
		inp.setAttribute("value",email1);
		f.appendChild(inp);

		f.submit();	
		
		/* location.href="${contextPath}/mail/mailSending.do"; */
	}
	function successIn(){
		alter("가입을 축하드립니다.");
	}
</script>
<style>
	body{}
</style>
<title>회원 가입</title>
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">
	
	<div class="jumbotron">
		<div class="container">
			<h1>회원 가입</h1>
		</div>
	</div>

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="${contextPath}/General/generAdd.do" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="pwd" type="text" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="pwd_confirm" type="text" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			
			<div class="form-group row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-offset-4">
					<input type="text" name="email" maxlength="50" placeholder="email" id="email"> 
					<select name="email2" id="email2">
					    <option >이메일선택</option>
						<option value="@naver.com">@naver.com</option>
						<option value="@daum.net">@daum.net</option>
						<option value="@gmail.com">@gmail.com</option>
						<option value="@nate.com">@nate.com</option>
					</select>
					   <input id="auth" type="button" onclick="mail()" class="btn btn-info" value="인증">
				</div>				
			</div>
			
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-3">
					<input type="submit" class="btn btn-primary " value="등록 " onclick="successIn()"> 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>