<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="style0.css">
	</head>
<body>
	<nav>		
        <h1>Star Taxi</h1>
    </nav>
	<center>
	<br/>
	<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
	%>
	You are not logged in<br/>
	<a href="index.jsp">Please Login</a>
	<%} else {
	%>
	Bun venit <%=session.getAttribute("username")%>, esti logat cu drepturi de <%=session.getAttribute("usertype")%>.
	<br/><a href='logout.jsp'>Log out</a>
	<br/><a href='<%=session.getAttribute("usertype")%>.jsp'>Mergi la pagina principala</a>
	<%
	    }
	%>
	</center>
</body>
</html>
