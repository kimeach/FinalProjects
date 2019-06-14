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
 	<script src="//code.jquery.com/jquery-3.3.1.js"></script> 
	<script type="text/javascript">	

	 function backToList(obj){
	 obj.action="${contextPath}/board/listPaging.do";
	 obj.submit();
	 } 
 
	  function readURL(input) {
	      if (input.files && input.files[0]) {
	          var reader = new FileReader();
	          reader.onload = function (e) {
	              $('#preview').attr('src', e.target.result);
	          }
	          reader.readAsDataURL(input.files[0]);
	      }
	  }  
	</script> 
<title>답글쓰기</title>
</head>

<body>

 <h1>　</h1>
 
  <form name="frmReply" method="post"  action="${contextPath}/board/addReply.do"   enctype="multipart/form-data">
    <table align="center">
    	<tr height="15">
	    	<td colspan="5" align="center" /> 
		</tr>	
    <%-- <input type="hidden" name="articleNO"  value="${articleNO}"/> --%>
    <input type="hidden" name="parentNO"  value="${parentNO}" />
    <input type="hidden" name="sido" value="${sido}" />
	<input type="hidden" name="gugun" value="${gugun}" />
	<input type="hidden" name="groupNO" value="${groupNO}" />
    	
		<tr>
			<td width="150" align="center">작　성　자　</td>
			<td colspan=2  align="left">
				<c:choose>
				    <c:when test="${not empty member.id && member.id!='null'}">
				        <input type="text" size="67" maxlength="100"  value="${member.id}" name="id" disabled/>
						<input type="hidden" size="67" maxlength="100"  value="${member.id}" name="id"/>
				    </c:when>
				    <c:otherwise>
				       <input type="text" size="67" maxlength="100"  value="${comMember.name}" name="id" disabled/>
						<input type="hidden" size="67" maxlength="100"  value="${comMember.name}" name="id"/>
				    </c:otherwise>
				</c:choose>			
			</td> <!-- readonly는 값 넘어감, disabled는 X -->			
		</tr>
		<tr>
			<td width="150" align="center">지　　　역　</td>
			<td colspan="2"  align="left"><input type="text" size="10"  value="${sido}"  disabled/>
													<input type="text" size="10"  value="${gugun}"  disabled/> </td> 
		</tr>
		<tr>
			<td width="150" align="center">제　　　목　</td>
			<td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
		</tr>
		<tr>
			<td width="150" align="center" valign="top"><br>내　　　용　</td>
			<td colspan="2"><textarea name="content" rows="20" cols="65" maxlength="4000" style="resize:vertical;"> </textarea> </td>
		</tr>
<!-- 		<tr>
			<td width="150" align="center">첨부파일　</td>
			<td colspan="2" align="left"><input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
            <td><img  id="preview" src="#"   width=200 height=200/></td>
		</tr> -->
		<tr>
			<td> </td>
			<td align="right">
				<input type=submit value="답글쓰기" />
				<input type=button value="취소"onClick="backToList(this.form)" />				
			</td>
		</tr>    
		<tr height="85">
	    	<td colspan="5" align="center" /> 
	    </tr>	
    </table>  
  </form>
  
</body>
</html>