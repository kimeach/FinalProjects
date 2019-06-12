<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#mouse:hover{color:red;}
</style>

<script type="text/javascript">
/* function show(){
	
	var dis=document.getElementById("display").style;
	if(dis.display=='none'){
	      dis.display="block";
	}
	else if(dis.display==""||dis.display=="block"){
		dis.display="none";
	}
} */


function show(){
	
	var dis=document.getElementById("display");
    dis.style.display="block";
	
	if(dis.style.display==""||dis.style.display=="block"){
		if(document.form.display.value==""){
			alert("관심 코드를 입력하세요!");
		}else{
			alert("페이지로 이동합니다.");
			document.form.submit();
		
		}
	}
}


</script>
</head>
<%String sessionId=(String)session.getAttribute("sessionId"); %>

<body>

<div align="right">
   <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <small>환영합니다. ${member.name }님!</small>
            <a href="${contextPath}/member/logout.do"><small>로그아웃</small></a>
            <a href="${contextPath}/member/mypage.do"><small>마이페이지</small></a>
            
          </c:when>
          <c:otherwise>
	        <a href="${contextPath}/member/loginForm.do"><small>로그인</small></a>
	        <a href="${contextPath}/member/memberForm.do"><small>회원가입</small></a>
	      </c:otherwise>
	   </c:choose>     
</div>

<nav class="navbar-inline navbar-expend" align="center" >
<p><a href="${contextPath}/magagine/index.do"><img  src=" ${contextPath}/resources/images/logo.png"></a></p>
     <a class="navbar-brand text-dark" href="${contextPath}/magagine/fashion.do" ><b>Fashion</b></a>
      <a class="navbar-brand text-dark" href="${contextPath}/magagine/beauty.do" ><b>Beauty</b></a>
       <a class="navbar-brand text-dark" href="${contextPath}/magagine/living.do" ><b>Living</b></a>
        <a class="navbar-brand text-dark" href="${contextPath}/magagine/people.do" ><b>People</b></a>
        <a class="navbar-brand text-dark" href="${contextPath}/magagine/about.do" ><b>About</b></a>
         <a class="navbar-brand text-dark" href="${contextPath}/sub/subscribe.do" ><b>Subscribe</b></a>
        <a class="navbar-brand text-dark" href="${contextPath}/board/listArticles.do" ><b>Q&A</b></a>
<label>
<form action="search.jsp" name="form" method="post" >
<label><input type="text"  placeholder="Search" style="display:none;border-radius: 5px;" id="display" name="sch"></label>           
<!-- <button type="button" class="btn btn-success" onclick="show()">search</button><p> -->
<input type="image" src="<%=getServletContext().getContextPath() %>/resources/images/search_3.png" onclick="show(); return false;">
</form>
</label>

<!-- <img alt="" src="./resources/images/search_3.png"> -->
<!-- <input class="form-control" type="text" placeholder="search">
<button class="btn btn-success" type="submit">검색</button> -->

</nav>

 
</body>
</html>