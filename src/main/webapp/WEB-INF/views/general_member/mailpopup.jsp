<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>

<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">

	<script type="text/javascript">
	window.name = "child";

	function checkCode(){
		while(1){
			var auth=prompt("인증번호를 입력하세요","");	
			if("${buffer}"==auth){
				alert("인증에 성공하였습니다");
				break;
			}else if(auth==null){
				break;
			}else{
				alert("다시 시도해주세요");
			}			
		}
		history.back();		
	} 
	
/* 	function checkCode(){
		var code = form2.code.value;
			if("${buffer}"==code){
				alert("인증에 성공하였습니다");
				break;
			}else if(code==null){
				break;
			}else{
				alert("다시 시도해주세요");
			}			
		history.back();	
		}*/
	
	function successIn(){
		alter("가입을 축하드립니다.");
	} 

	</script>

	<div class="container">
	
<!-- 		<div class="form-group row ">
			<form id="form2" action="javascript:getPassword()">
				<label class="col-sm-2">인증번호</label>
				<div class="col-sm-3">
					<input type="text" name="code" id="code" 
						onkeyup="checkCode()" placeholder="인증번호를 입력하세요." >
					<div id="checkCode"></div>
				</div>
				<div>		
				 	<input id="checkCode" type="button" onclick="checkCode()" class="btn btn-info" value="인증하기">	
				</div>
			</form>	
		</div>	 -->	
		
		<div class="form-group row " style="padding: 20% 0 20% 45%;">
				<label class="col-sm-2">이메일<br> 인증 확인</label>
				<div class="col-sm-3">
				 	<input id="checkCode" type="button" onclick="checkCode()" class="btn btn-info" value="인증하기">	
				</div>
		</div>		
			
				
	
	
</body>
</html>