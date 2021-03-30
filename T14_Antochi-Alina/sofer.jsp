<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Star Taxi</title>
	<link rel="stylesheet" href="style-sofer.css">
	</head>
	<%@ page import ="java.sql.*" %>
<body>

	<div id="logout">
		<p>Cont sofer</p>
		<a href='logout.jsp'>Log out</a>
	</div>
	<nav>		
        <h1>Star Taxi</h1>
    </nav>
    <br/>
    <center>
	<h2><a href="inreg_cursa.jsp">Inregistreaza o cursa</a></h2>
	
	<h2>Vezi raportul pentru data</h2>
	
	<form method="post" action="raport_sofer.jsp">
		<input type="date" name = "data" value="2020-05-29" id="data" />
		<input type="submit" value="Vezi raport" />
	</form>
	</center>
</body>
</html>