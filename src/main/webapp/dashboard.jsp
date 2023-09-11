<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="./css/dash.css">

</head>

<body >
<%@ page import="java.util.*, demo.UserRes, demo.data, demo.User"%>
<%

String roll = null;
UserRes ur = null;
User uatt = null;
try{
roll = (String)session.getAttribute("roll");
ur = demo.data.getUserRes(roll);
uatt = demo.data.getUserAtt(roll);


if(ur.getRoll() == null || uatt.getRoll() == null)
{
	out.print("<script>window.location.replace('pnf.jsp')</script>");
}
}
catch(Exception e)
{
	out.print("<script>window.location.replace('pnf.jsp')</script>");	
}

//out.print("<script>alert('err')</script>");
%>
<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<div class="container">

<h1 style="font-size:64px" align='center'>
Dashboard
</h1>
<center>
<div class="card">
<div class="cont">
<div class="heading"> Welcome <%=ur.getName() %>  <span class="headingsub">(<%=ur.getRoll() %>)</span></div>


<div class="maintext">Your CGPA is : <span class="subtext"><%=ur.getCgpa() %></span></div>
<div class="maintext">Your Attendence is : <span class="subtext"><%=uatt.getAtt() %>%</span></div>
</div>
</div>

<a  href="students.jsp" style="color: var(--text-color);">Back</a>
</div>
</center>

<script>
window.addEventListener("DOMContentLoaded", (event) => {
	
	if(sessionStorage.getItem("theme") != '')
		{
		document.documentElement.setAttribute("data-theme",sessionStorage.getItem("theme"));
		
		document.getElementById('dm').innerHTML = (sessionStorage.getItem("theme")=="dark")?"Light mode":"Dark mode";
		}
	else{
	  document.documentElement.setAttribute("data-theme","light");
	}
	});
	
	

function togglemode()
{
	const frames=[{"opacity" : 0.8}, {"opacity": 1}];
	document.documentElement.animate(frames,500);
	
	var curr_theme = document.documentElement.getAttribute("data-theme");
	var switch_theme = (curr_theme == "dark")?"light":"dark";
	document.documentElement.setAttribute("data-theme", switch_theme);
	sessionStorage.setItem("theme", switch_theme);
	
	if(curr_theme == "dark")
		{
		document.getElementById("dm").innerHTML = "Dark mode";
		}
	else if(curr_theme == "light"){
		document.getElementById("dm").innerHTML = "Light mode";
	}
	else{
		console.log("error");
	}
	
	
}
</script>
</body>
</html>