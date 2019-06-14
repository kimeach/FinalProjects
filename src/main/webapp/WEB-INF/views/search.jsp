<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String search=request.getParameter("sch");
%>
<%out.println(search); 
if(search.equals("검색어")){
%><script>location.href = "경로"; </script>
<% }
else if(search.equals("빌라")){
	%><script>location.href=""</script>
<%}else if(search.equals("")){
	%><script>location.href=""</script>
<%}else if(search.equals("")){
	%><script>location.href=""</script>
	<% }
%>
</body>
</html>