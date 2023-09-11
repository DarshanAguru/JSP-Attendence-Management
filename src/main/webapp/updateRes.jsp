<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="demo.UserRes, demo.data" %>
<%

if(request.getParameter("uname") != null)
{
 String name = request.getParameter("uname");
 String rollno = request.getParameter("uroll");
 String branch = request.getParameter("ubranch");
 String cgpa = request.getParameter("ucgpa");
	UserRes u = new UserRes();
	u.setRoll(rollno);
	u.setName(name);
	u.setBranch(branch);
	u.setCgpa(cgpa);

	
	int st = demo.data.updateRes(u);
	if(st == 0)
	{
		out.print("<script>alert('Unable to process the request')</script>");
		out.print("<script>window.location.replace('editRes.jsp')</script>");
		
	}
	else{
		out.print("<script>window.location.replace('res.jsp')</script>");
	}
}
%>
</body>
</html>