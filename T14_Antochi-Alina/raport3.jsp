<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Star Taxi</title>
	<link rel="stylesheet" href="style-manager.css">
	</head>
	<%@ page import ="java.sql.*" %>
<body>
	<div id="logout">
		<p>Cont manager</p>
		<%out.println("<a href='logout.jsp'>Log out</a>");%>
	</div>
	<nav>		
        <h1>Star Taxi</h1>
    </nav>
    <br/>
	<%
	String data = request.getParameter("data3");

	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
   	 Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("select sum(cant_combustibil) from curse where data_factura = '"+data+"'");
    rs.next();
    float cant = rs.getFloat(1);
	%>
	<h2>La data de <%=data%>, a fost consumata o cantitate de <%=cant%> unitati de combustibil.</h2>

</body>
</html>