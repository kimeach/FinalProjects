<%@page import="java.util.Random"%>
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
<body style="font-family: jejugothic ">
<%
StringBuffer Num = new StringBuffer();
Random rnd = new Random();


for (int i = 0; i < 15; i++) {
       Num.append((int) (rnd.nextInt(10)));
}

%>

<script type="text/javascript">
var aNum ="<%=Num%>";


while(1){
	var auth=prompt("인증번호를 입력하세요","");	
	if("${buffer}"==auth){
		alert("인증에 성공하였습니다");
		alert("사업자 코드를 전송합니다");
		alert(aNum);

		break;
	}else if(auth==null){
		break;
	}else{
		alert("다시 시도해주세요");
	}
}

 var f=document.createElement("form");
f.setAttribute("method","get");
f.setAttribute("action","${contextPath}/Company/comMemberForm.do");
document.body.appendChild(f);


var inp3=document.createElement("input");
inp3.setAttribute("type","text");
inp3.setAttribute("name","aNum");
inp3.setAttribute("value",aNum);
f.appendChild(inp3);


var inp4=document.createElement("input");
inp4.setAttribute("type","text");
inp4.setAttribute("name","ema");
inp4.setAttribute("value","${ema}");
f.appendChild(inp4);

var inp5=document.createElement("input");
inp5.setAttribute("type","text");
inp5.setAttribute("name","ema2");
inp5.setAttribute("value","${ema2}");
f.appendChild(inp5);

alert(aNum+"값을 넘겼습니다"); 
alert("${ema}"+"값을 넘겼습니다"); 
alert("${ema2}"+"값을 넘겼습니다"); 
f.submit();	
</script>
</body>
</html>