<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>

<link rel="stylesheet" href="./css/attd.css">
</head>

<body >
<button type="button" class="dm" onclick="togglemode()" id="dm">Dark mode</button>
<div class="container">
<h1 style="font-size: 46px;" align='center'>
Attendance Panel
</h1>
<%@ page import="java.util.*, demo.User, demo.data"%>

<table align="center">
<thead>
<tr class="main-row">
<th>Roll No</th>
<th>Name </th>
<th>Branch</th>
<th>Attendance</th>
<th colspan="2">Action</th>

</tr>

</thead>


<tbody>
<%
ArrayList<User> ar = demo.data.displayAtt();
int id = 0;
for(User u : ar)
{
	
		out.print("<tr class= \"row-"+id+"\">");
		out.print("<td>" + u.getRoll() + "</td>");
		out.print("<td>" + u.getName() + "</td>");
		out.print("<td>" + u.getBranch() + "</td>");
		out.print("<td>" + u.getAtt() + "%</td>");
		out.print("<td> <a class='colred' href='deleteAtt.jsp?roll=" +u.getRoll()+"'>Delete</a></td>" );
		out.print("<td> <a class='colgreen' href='editAtt.jsp?roll=" + u.getRoll()+"'>Edit</a></td>");
		out.print("</tr>");
		id = (id==0)?1:0;
		
}

%>
</tbody>
</table>
<center>
<a class="btn-data" href="entrydataAtt.html">Enter data</a>


</center>

</div>

<a class="btn-back" href="home.jsp">Back</a>


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
</body>
</html>