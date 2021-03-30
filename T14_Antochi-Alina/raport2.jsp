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
	String cod_masina = request.getParameter("masina");
	String data = request.getParameter("data2");

	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
    	Statement st = con.createStatement();
    
    	ResultSet rs = st.executeQuery("SELECT SUM( cant_combustibil ) FROM curse "+
    		"WHERE data_factura = '" + data + "' AND cod_masina =" + cod_masina);
	
    rs.next();
    float cant = rs.getFloat(1); 
    
    ResultSet rs2 = st.executeQuery("select marca, model, cod_comb from masini where cod_masina = "+ cod_masina); 
    rs2.next();
    
	String marca=rs2.getString(1);
	String model=rs2.getString(2);
	String masina = marca+ ' '+model;
	int cod_comb = rs2.getInt(3);
	
	ResultSet rs3 = st.executeQuery("select nume_comb, unit_masura from combustibil where cod_comb = "+cod_comb); 
	rs3.next();
	String comb = rs3.getString(1);
	String unit = rs3.getString(2);
	%>
	<h2>La data de <%=data%>, masina <%=masina%> a consumat <%=cant%><%=unit%> de <%=comb %>.</h2>

</body>
</html>