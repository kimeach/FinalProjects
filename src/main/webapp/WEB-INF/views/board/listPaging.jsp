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
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
  <style>
	body{font-family: 'Jeju Gothic', sans-serif; }
  </style>
  
  <meta charset="UTF-8">
  <title>문의/의뢰 게시판</title>
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	function fn_search_form(url){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	     var searchInput = document.createElement("input");
	     searchInput.setAttribute("type","text");
	     searchInput.setAttribute("name", "keyword");
	     searchInput.setAttribute("value", document.getElementById('keyword').value);
		 
	     form.appendChild(searchInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
   
	function fn_articleForm(isLogOn,articleForm,loginForm){
		if(isLogOn != '' && isLogOn != 'false'){
		    location.href=articleForm;
		  }else{
		    alert("로그인 후 글쓰기가 가능합니다.")
		    location.href=loginForm;
		  }			
	}  
	</script>
</head>  

<body>

	<table align="center" width="80%" >
		<tr height="148">
	    	<td colspan="5" align="right" /> 
	    </tr>
	  <tr height="40" align="center" >
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
					<td width="7%">
						<c:choose>
						    <c:when test="${not empty article.id && article.id!='null'}">	${article.id}</c:when>
						    <c:otherwise>${article.name}</c:otherwise>
						</c:choose>				
					</td>
					<td width="12%">[${article.address}]</td>
					<td align='left'  width="30%">
					  <span style="padding-right:30px"></span>
					   <c:choose>
					      <c:when test='${article.levelNO > 0 }'>  
					         <c:forEach begin="1" end="${article.levelNO}" step="1">
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
					<a href="javascript:fn_articleForm
		      									('${isLogOn}','${contextPath}/board/articleForm.do','${contextPath}/login.do')">
	            		<input type="submit" value="글쓰기" />
	           		</a>
			  </td>
	     </tr>
	     <tr>
		      <td colspan="5" align="center"> 
			  	<div class="pagination">
			  				<c:if test="${pageMaker.prev==true}">
			  					<a href="${contextPath}/board/listPaging.do?keyword=${keyword}&page=${pageMaker.startPage-1}">&laquo;</a>		  					
			  				</c:if>
			  				
			  				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			  					<span <c:out value="${pageMaker.criteria.page==idx?'class=active':''}"/>>
			  						<a href="${contextPath}/board/listPaging.do?keyword=${keyword}&page=${idx}">${idx}</a>		
			  					</span>   					
			  				</c:forEach>
			  				
			  				<c:if test="${pageMaker.next==true && not empty pageMaker.endPage}">		  				
			  						<a href="${contextPath}/board/listPaging.do?keyword=${keyword}&page=${pageMaker.endPage+1}">&raquo;</a> 
			  				</c:if>
			  	</div>	
			  </td>
	     </tr>
	    <tr>
	    	<td colspan="5" align="right"> 
				<input type="text" size="20" maxlength="100"  name="keyword" id="keyword"/>
				 <input type="submit" value="검색" 
				  onclick="fn_search_form('${contextPath}/board/listPaging.do')"  />
			</td>
	     </tr>
	    <tr height="212">
	    	<td colspan="5" align="right" /> 
	    </tr>
	</table> 
</body>

</html>