<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Students</title>
<link rel="stylesheet" href="./css/login_style.css">
</head>
<body>
<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<%
if(request.getParameter("roll") != null)
{
	String rollNo = request.getParameter("roll");
	String pass = request.getParameter("pass");
	
	if(pass.equals(rollNo))
	{
	session.setAttribute("roll", rollNo);
	out.println("<script>window.location.replace('dashboard.jsp')</script>");
	}
	else{
		out.println("<script>alert('invalid credentials');</script>");
	}
}
%>
<div class="container">
<center>
<h2 style="font-weight: bolder; font-size:  40px;  color: var(--text-color)"> Students Login </h2>
</center>
<div class="login-form">
<form  action="" method="post">

<div id="name" class="main-text">Enter Roll No.</div> 
<input class="inp-text" name = "roll" type="text" value="" required>

<div id="pass" class="main-text">Enter Password</div> 
<input class="inp-text" name="pass" type="password" value="" required>
<br>
<center>
<input id="btn-submit" class="btn-submit" type = "submit" name="submit" value="Login">
</center>
</form>
</div>
<a href='index.jsp' style="color: var(--text-color)">Home page</a>
</div>

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

var btn = document.getElementById("btn-submit");
btn.addEventListener("mouseenter",(event)=>
{
	btn.style.padding = "10px";
	btn.style.transition= "0.2s ease-in";
	
});

btn.addEventListener("mouseout",(event)=>
{
	btn.style.padding = "";
	btn.style.transition= "0.2s ease-in";
});
var d = document.getElementById("name");
var e = document.getElementById("pass");
var q = document.querySelectorAll(".inp-text");

q[0].addEventListener("focusin", (event)=>{q[0].style.transition="0.5s ease";q[0].style.padding = "10px" ;d.style.color="var(--focus-color)";d.style.fontSize= "16px";d.style.transition = "0.5s ease";});
q[1].addEventListener("focusin", (event)=>{q[1].style.transition="0.5s ease";q[1].style.padding = "10px" ;e.style.transition = "0.5s ease";e.style.color="var(--focus-color)";e.style.fontSize= "16px"});
q[0].addEventListener("focusout", (event)=>{q[0].style.transition="0.5s ease";q[0].style.padding = "" ;d.style.color="var(--text-color)";d.style.fontSize= "20px";d.style.transition = "0.5s ease";});
q[1].addEventListener("focusout", (event)=>{q[1].style.transition="0.5s ease";q[1].style.padding = "";e.style.transition = "0.5s ease";e.style.color="var(--text-color)";e.style.fontSize= "20px"});
</script>
</body>
</html>