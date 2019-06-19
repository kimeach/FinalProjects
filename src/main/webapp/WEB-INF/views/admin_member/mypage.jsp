<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<%String sessionNum=(String)session.getAttribute("sessionNum");%>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
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
<body style="font-family: 'Jeju Gothic', sans-serif;">

<div style="height:700px;">
<div style="padding-top:350px;">

<label>
<figure><a href="${contextPath}/Company/comList.do">
<img alt="기업리스트" src="${contextPath }/resources/img/company.png" width="100" height="100">
<figcaption>기업리스트</figcaption>
</figure></a>
</label>

<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>

<label>
<figure><a href="${contextPath}/General/generList.do">
 <img alt="일반회원리스트" src="${contextPath }/resources/img/mypage.png" width="100" height="100" >
<figcaption>일반리스트</figcaption>
  </figure></a>
  </label>

<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>


<c:choose>
    <c:when test="${isLogOn == true  && comMember!= null}">
       <label>
         <figure><a href="${contextPath}/Company/comUpdateForm.do?authNum=${comMember.authNum }" class="no-underline">
            <img alt="회원정보수정" src="${contextPath }/resources/img/mod.png" width="120" height="120">
            <figcaption>내 정보수정</figcaption>
         </figure></a>
         </label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
         
         <label>
         <figure><a href="javascript:void(0);" onclick="deleteS();">
             <img alt="회원탈퇴" src="${contextPath }/resources/img/delete3.png" width="100" height="100" >
            <figcaption>회원탈퇴</figcaption>
           </figure></a>
           </label>
   </c:when>
   
    <c:when test="${isLogOn == true  && member!= null}">
       <label>
         <figure><a href="${contextPath}/Company/comUpdateForm.do?authNum=${comMember.authNum }" class="no-underline">
            <img alt="회원정보수정" src="${contextPath }/resources/img/mod.png" width="120" height="120">
            <figcaption>내 정보수정</figcaption>
         </figure></a>
         </label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
         
         <label>
         <figure><a href="javascript:void(0);" onclick="deleteF();">
             <img alt="회원탈퇴" src="${contextPath }/resources/img/delete3.png" width="100" height="100" >
            <figcaption>회원탈퇴</figcaption>
           </figure></a>
        </label>
   </c:when>
   
   <c:otherwise>
      <label>
         <figure><a href="${contextPath}/Company/comUpdateForm.do?authNum=${comMember.authNum }" class="no-underline">
            <img alt="회원정보수정" src="${contextPath }/resources/img/mod.png" width="110" height="110">
            <figcaption>내 정보수정</figcaption>
         </figure></a>
         </label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
<label></label><label></label><label></label><label></label><label></label><label></label><label></label>
         
         <label>
         <figure><a href="javascript:void(0);" onclick="deleteT();">
             <img alt="회원탈퇴" src="${contextPath }/resources/img/delete3.png" width="100" height="100" >
            <figcaption>회원탈퇴</figcaption>
           </figure></a>
        </label>
   </c:otherwise>
   
   </c:choose>
   
</div>
</div>   

</body>
</html>