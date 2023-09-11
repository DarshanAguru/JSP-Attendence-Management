<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="demo.UserRes, demo.data" %>
<%
String roll = request.getParameter("roll");
demo.UserRes u = demo.data.getUserRes(roll);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Res. <%=roll %></title>
<link rel="stylesheet" href="./css/entry.css">
</head>

<body>
<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<div class="container">
<center>
<h2 style="font-weight: bolder; font-size:  36px;  color: var(--text-color)"> Edit Result </h2>
</center>
<div class="login-form">
<form action="updateRes.jsp"  method="post">

<div class="main-text">Roll :</div> 
<div class="disp-roll"><%=u.getRoll()%></div> 
<input type="hidden" name = "uroll" value="<%=u.getRoll()%>">

<div class="main-text">Edit Name :</div> 
<input  class = "inp-text" type="text" name="uname" value="<%= u.getName()%>">

<div class="main-text">Edit Branch :</div>
<input class ="inp-text" type="text"  name="ubranch" value="<%= u.getBranch()%>">

<div class="main-text">Edit CGPA :</div> 
<input class ="inp-text" type="text"  name="ucgpa" value="<%= u.getCgpa()%>">

<center>
<input id="btn" class="btn-submit" type = "submit" name="btn_sub" value="Update">
</center>

</form>
</div>
<a class="btn-back" href="res.jsp">Back</a>
</div>

</body>

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
	var txt = document.getElementById("dm").innerHTML;
	if(txt == "Dark mode")
		{
		document.getElementById("dm").innerHTML = "Light mode";
		}
	else if(txt == "Light mode"){
		document.getElementById("dm").innerHTML = "Dark mode";
	}
	else{
		console.log("error");
	}
	
	
}
</script>

</html>

