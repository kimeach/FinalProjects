<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<head>
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<style>
	  body{font-family: 'Jeju Gothic', sans-serif;}
	</style>
  
<meta charset="UTF-8">
 <title>상세글</title>
	<style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }   
   </style>
 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO,sido,gugun){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);    
	     
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     
	     var isDel = confirm("삭제하시겠습니까?");
	     if(isDel) form.submit();
	     else
	    	 return;
	 }
 
	 function fn_reply_form(url, articleNO, sido, gugun, groupNO){	 
		 
		 var form = document.createElement("form");
		 form.setAttribute("method","post");
		 form.setAttribute("action", url);
		 form.setAttribute("enctype", "multipart/form-data");
		 var parentNOInput = document.createElement("input");
		 parentNOInput.setAttribute("type","hidden");
		 parentNOInput.setAttribute("name","parentNO");
		 parentNOInput.setAttribute("value", articleNO);/* 여기서는 articleNO가 답글에서는 parentNo가 됨 */
	     var sidoInput = document.createElement("input");
	     sidoInput.setAttribute("type","text");
	     sidoInput.setAttribute("name","sido");
	     sidoInput.setAttribute("value", sido);
	     var gugunInput = document.createElement("input");
	     gugunInput.setAttribute("type","text");
	     gugunInput.setAttribute("name","gugun");
	     gugunInput.setAttribute("value", gugun);	 
	     var groupNOInput = document.createElement("input");
	     groupNOInput.setAttribute("type","hidden");
	     groupNOInput.setAttribute("name","groupNO");
	     groupNOInput.setAttribute("value", groupNO);	 

 		 form.appendChild(parentNOInput);
	     form.appendChild(sidoInput);
	     form.appendChild(gugunInput);
	     form.appendChild(groupNOInput);
	     
		 document.body.appendChild(form);
		 form.submit();	
	 }

	 function readURL(input){
		 if(input.files && input.files[0]){
			 var reader = new FileReader();
			 reader.onload = function (e) {
				 $('#preview').attr('src', e.target.result);
			 }
			reader.readAsDataURL(input.files[0]);
		 }
	 }
	function backToList(obj){
		obj.action="${contextPath}/board/listPaging.do";
		obj.submit();
		}

	</script>
</head>

<body>
<h2>　</h2>
 	<form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
		<table align="center">
			
			<tr>
				<td width="150" align="center">글　번　호</td>
			  	<td colspan="2" align="left"><input type="text" size="67" name="articleNO" value="${article.articleNO}" disabled />
			  											<input type="hidden" size="67" name="groupNO" value="${article.groupNO}" disabled />
			  	</td>			  						
			</tr>
			<tr>
			   <td width="150" align="center" >작　성　일</td>
			   <td align="left"><input type="text" size="67" value="<fmt:formatDate value="${article.writeDate}"/>" disabled/></td>
			</tr>
			<tr>
		    	<td width="150" align="center" >작　성　자</td>
		    	<td align="left">				
		    		<c:choose>
						<c:when test="${not empty article.id && article.id!='null'}">
							<input type="text" size="67" name="writer" value="${article.id}"  disabled/>
							<input type="hidden" size="67" maxlength="100"  value="${article.id}" name="id"/>
						</c:when>
						<c:otherwise>
							<input type="text" size="67" name="writer" value="${article.name}"  disabled/>
							<input type="hidden" size="67" maxlength="100"  value="${article.name}" name="name"/>
						</c:otherwise>
					</c:choose>		
				</td>
		  	</tr>
		  	<tr>
		    	<td width="150" align="center" >지　　　역</td>
		  		<td align="left"><input type="text" size="10" name="writer" value="${article.sido}"  disabled/>
		  								<input type="text" size="10" name="writer" value="${article.gugun}"  disabled/></td>
		  	</tr>		  	
		  	<tr>
		    	<td width="150" align="center" >제　　　목</td>
		    	<td align="left"><input type="text" size="67" name="title" value="${article.title}" /></td>
		    </tr>
		  	<tr>
		    	<td width="150" align="center" >내　　　용</td>
		    	<td><textarea rows="20" cols="65" name="content" id="i_content" style="resize:vertical;">${article.content}</textarea></td>
		    </tr>
				
			<!-- id와 authNum 둘다 해당되게 수정해야함 / 로그인시 답글 버튼 뜸 / 글쓴이와 로그인ID 같을경우 수정,삭제버튼 뜸 -->
			<tr id="tr_btn">
				<td colspan="5" align="right">
					<c:if test="${member.id == article.id }"> 
						<input type="button" value="수정" onclick="fn_modify_article(this.form)" /> 
						<!-- <input type="button" value="수정" onclick="fn_modify_article(this.form)" /> -->
						<input type="button" value="삭제" 
								  onClick="fn_remove_article('${contextPath}/board/removeArticle.do',${article.articleNO})" />
					 </c:if> 				

					<c:if test="${not empty member.id && member.id!='null' || not empty comMember.authNum && comMember.authNum!='null'}">
						<input type="button" value="답글" 
						 onclick="fn_reply_form('${contextPath}/board/replyForm.do','${article.articleNO}','${article.sido}','${article.gugun}','${article.groupNO}')" />
					</c:if> 
					
					<input type="button" value="목록" onclick="backToList(this.form)" />					
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>