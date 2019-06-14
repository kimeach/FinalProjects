<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      #container {
        width: 100%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 5px;
       /*  margin-bottom: 5px; */
        border: 0px solid;
        background-color: #EAEAEA; 
        font-size:25px;        
      }
      #headerMenu {
        padding: 5px;
       /*  margin-bottom: 5px; */
        border: 0px solid;    
        background-color: #EAEAEA; 
        font-size:25px;   
      }
      
      #content {
        width: 100%;         
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer {
        width: 100%;    
        clear: both;
        padding: 0px ;
        border: 0px solid #bcbcbc;
        background-color: #EAEAEA;
        font-size:15px;         
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
  	<body>
  
	    <div id="container">
	      
	      <div id="header">
	         <tiles:insertAttribute name="header"/>
	      </div>
	      
	      <div id="headerMenu">
	         <tiles:insertAttribute name="headerMenu"/>
	      </div>
	      
	      <div id="content">
	          <tiles:insertAttribute name="body"/>
	      </div>
	      
	      <div id="footer">
	          <tiles:insertAttribute name="footer"/>
	      </div>
	      
	    </div>
    
	</body>
</html>