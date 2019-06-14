<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
<%String sessionNum=(String)session.getAttribute("sessionNum");%>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8"> 
  <title>사이드 메뉴</title>
    <script type="text/javascript">
  function deleteF(){
	  var re1=confirm("정말 탈퇴하시겠어요?");
		if(re1==true){
			 location.href="${contextPath}/General/generRemove.do?id= ${id}"
		}else{
			history.back();
		}

  }
  
  function deleteS(){
	  
	  var re2=confirm("정말 탈퇴하시겠어요?");
		if(re2==true){
			  location.href="${contextPath}/Company/comRemove.do?authNum=${comMember.authNum }"
		}else{
			history.back();
		}
		}
  
  function deleteT(){
	  
	  var re3=confirm("정말 탈퇴하시겠어요?");
		if(re3==true){
			 location.href="${contextPath}/Admin/adminRemove.do?id=${admember.id}"
		}else{
		    history.back();
	}
  }
  
  </script>
</head>
<body>
<c:choose>
    <c:when test="${isLogOn == true  && comMember!= null}">
    <h3>
		<a href="${contextPath}/Company/comUpdateForm.do?authNum=${comMember.authNum }">내정보 수정</a><br>
		<a href="javascript:void(0);" onclick="deleteS();" >회원탈퇴</a>
	</h3>
	</c:when>
	
    <c:when test="${isLogOn == true  && member!= null}">
	<h3>
		<a href="${contextPath}/General/generUpdateForm.do?id=${member.id}"  class="no-underline">내정보 수정</a><br>
		<a href="javascript:void(0);" onclick="deleteF();" >회원탈퇴</a>
	</h3>
	</c:when>
	
	<c:otherwise>
	<h3>
	<a href="${contextPath}/Admin/adminUpdateForm.do?id=${admember.id}"  class="no-underline">내정보 수정</a><br>
		<a href="javascript:void(0);" onclick="deleteT();" >회원탈퇴</a>
		</h3>
	</c:otherwise>
	
	</c:choose>
</body>
</html>












