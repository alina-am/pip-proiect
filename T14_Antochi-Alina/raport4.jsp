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
	String data1 = request.getParameter("data41");
	String data2 = request.getParameter("data42");

	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("SELECT SUM( cant_combustibil ) FROM curse "+
    		"WHERE data_factura >= '"+data1+"' AND data_factura <= '"+data2+"'");
    rs.next();
    float cant = rs.getFloat(1);
%>
	<h2>In perioada <%=data1%> - <%=data2%>, a fost consumata o cantitate de <%=cant%> unitati de combustibil.</h2>

</body>
</html>