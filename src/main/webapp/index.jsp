<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="./css/mainpage.css">
</head>
<body>
<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<div class="container">
<div class="card">
<img src="./imgs/admin.png" class="admin-img" id="admin" alt="Admin image">
<a href="admin.jsp"><b>ADMIN PAGE</b></a>
</div>
<div class="card">
<img src="./imgs/students.png" class="students-img" id="students" alt="Students image">
<a href="students.jsp"><b>STUDENTS PAGE</b></a>
</div>
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

goto("admin");
goto("students");

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


function goto(id)
{
	var d = document.getElementById(id);
	d.addEventListener("click", (event)=>{
		window.location.replace(id+".jsp");
		
	})
}

</script>
</body>
</html>