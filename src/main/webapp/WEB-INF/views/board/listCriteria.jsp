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
 	<style>
	   .cls1 {text-decoration:none;}
   		.cls2{text-align:center; font-size:30px;}
  	</style>
  
  <meta charset="UTF-8">
  <title>게시글 목록</title>
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
/*  	 function fn_write(obj){
	  obj.action="${contextPath}/board/articleForm.do";
	  obj.submit();
	  } 
   */
   
  /* 	function fn_articleForm(isLogOn,articleForm,loginForm){
  if(isLogOn != '' && isLogOn != 'false'){
    location.href=articleForm;
  }else{
    alert("로그인 후 글쓰기가 가능합니다.")
    location.href=loginForm+'?action=/board/articleForm.do';
  }
}  */
	</script>
</head>  

<body>
<h1>　</h1>
<table align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgreen">
     <td >글번호</td>
     <td >작성자</td>  
     <td> 지역 </td>            
     <td >제목</td>
     <td >작성일</td>
  </tr>
<c:choose>
  	<c:when test="${articlesList ==null }" >
	    <tr  height="10">
	      <td colspan="4">
	         <p align="center">
	            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
	        </p>
	      </td>  
	    </tr>
 	</c:when>
 	<c:when test="${articlesList !=null }" >
    	<c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
	    	<tr align="center">
				<td width="5%">${article.articleNO}</td>
				<td width="7%">${article.id }</td>
				<td width="12%">[${article.sido}][${article.gugun}]</td>
				<td align='left'  width="30%">
				  <span style="padding-right:30px"></span>
				   <c:choose>
				      <c:when test='${article.level > 1 }'>  
				         <c:forEach begin="1" end="${article.level }" step="1">
				              <span style="padding-left:20px"></span>    
				         </c:forEach>
				         <span style="font-size:12px;">[답변]</span>
			                   <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
				          </c:when>
				          <c:otherwise>
				            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
				          </c:otherwise>
				        </c:choose>
				  </td>
				  <td  width="10%">${article.writeDate}</td> 
			</tr>
		</c:forEach>
     </c:when>
 </c:choose>
	 <tr>
	      <td colspan="5" align="right"> 
		       <a href="${contextPath}/board/articleForm.do"><input type="submit" value="글쓰기" /></a>
		  </td>
     </tr>
     <tr>
	      <td colspan="5" align="center"> 
		      페이지 띄우기
		  </td>
     </tr>
        <tr>
	      <td colspan="5" align="right"> 
	      <input type="text" size="20" maxlength="100"  name="search"/>
		  <input type="submit" value="검색" />
		  </td>
     </tr>
</table>
 
<%-- <a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><p class="cls2">글쓰기</p></a> --%>
</body>
</html>