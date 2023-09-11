<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
<%@page import="demo.data" %>
<%
if(request.getParameter("roll") != null)
{
 String roll = request.getParameter("roll");
 int st = demo.data.deleteRes(roll);
 if(st == 0)
 {
	 out.print("<script>alert('Unable to process the request')</script>");
		out.print("<script>window.location.replace('res.jsp')</script>");
	}
 else{
	 out.print("<script>window.location.replace('res.jsp')</script>");
 }
 }
%>
</body>
</html>