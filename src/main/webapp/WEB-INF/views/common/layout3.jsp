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
        border: 0px solid;
      }
      #header {
        padding: 5px;
        margin-bottom: 5px;
        border: 0px solid;
        
      }
      
       #sidebar-left {
        width: 15%;
        height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;
        float: left;
         background-color: gray;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      
      #content {
        position:absolute;
        height:300px;
        width: 400px;
        margin:-150px 0px 0px -200px;
        top:50%;
        left:50%;
        padding: 5px;
      
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid ;
         
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
   <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
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