<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
</head>
<body style="font-family: 'Jeju Gothic', sans-serif;">


<script type="text/javascript">
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

</script>
</body>
</html>