<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html >
<html>
<head>
<meta "charset=utf-8">
<title>파일업로드 하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<script>
 function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
     
 }

 function up(){

	var op=opener.document.getElementById('pre');
	var cp=document.getElementById("preview").value;
	op.src=cp;
	
	self.close();
 }      
      </script>
</head>
<body style="font-family: jejugothic ">
<h1>파일 업로드 하기</h1>
<form method="post" action="${contextPath}/upload.do" enctype="multipart/form-data"> 
	 <td align="right">이미지파일 첨부:  </td>
			  <td> <input type="file" name="imageFile"  onchange="readURL(this);" /></td>
			  <td><img  id="preview" src="#"   width=200 height=200/></td>
		<input type="submit"  value="업로드" />
</form>
</body>
</html>