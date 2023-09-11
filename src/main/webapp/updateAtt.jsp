<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="demo.User, demo.data" %>
<%

if(request.getParameter("uname") != null)
{
 String name = request.getParameter("uname");
 String rollno = request.getParameter("uroll");
 String branch = request.getParameter("ubranch");
 String att = request.getParameter("uatt");
	User u = new User();
	u.setRoll(rollno);
	u.setName(name);
	u.setBranch(branch);
	u.setAtt(att);

	
	int st = demo.data.updateAtt(u);
	if(st == 0)
	{
		out.print("<script>alert('Unable to process the request')</script>");
		out.print("<script>window.location.replace('editAtt.jsp')</script>");
		
	}
	else{
		out.print("<script>window.location.replace('att.jsp')</script>");
	}
}
%>
</body>
</html>