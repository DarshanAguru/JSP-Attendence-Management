<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="./css/mainpage.css">
<style>
.link-below
{
	positon: relative;
	margin-left: 45%;
	z-index: 0;
	margin-top: -10%;
}
</style>
</head>
<body>


<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<div class="container">
<div class="card">
<img src="./imgs/att.png" class="admin-img" id="att" alt="Attendence image">
<a href="att.jsp"><b>Attendence</b></a>
</div>
<div class="card">
<img src="./imgs/res.png" class="students-img" id="res" alt="Results image">
<a href="res.jsp"><b>Results</b></a>
</div>


</div>
<div class="link-below">
<a href='admin.jsp' style="color: var(--text-color)">Admin page</a>
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

goto("att");
goto("res");

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