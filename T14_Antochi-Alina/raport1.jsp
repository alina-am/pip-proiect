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
	String nume_sofer = request.getParameter("sofer");
	String data = request.getParameter("data1");


	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
    	Statement st = con.createStatement();
    
    	ResultSet rs = st.executeQuery("SELECT COUNT( * ) , SUM( nr_km ) FROM curse WHERE data_factura = '"+ data + "' "+
    		"AND cod_sofer = (SELECT cod_sofer FROM soferi WHERE LOWER( nume_prenume ) = LOWER( '"+ nume_sofer +"' ) )");
	
    rs.next();
    int nr_curse = rs.getInt(1);
    int km_curse= rs.getInt(2);
%>
	<h2>La data de <%=data%>, soferul <%=nume_sofer%> a efectuat un numar de <%=nr_curse%> curse si <%=km_curse%> km.</h2>

</body>
</html>