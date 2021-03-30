<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<%out.println("<a href='logout.jsp'>Log out</a>");%>
	</div>
	<nav>		
        <h1>Star Taxi</h1>
    </nav>
    <br/>
    <%
    String data = request.getParameter("data");
        
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
    Statement st = con.createStatement();
    
    String username = session.getAttribute("username").toString();
    ResultSet rs= st.executeQuery("SELECT cod_sofer FROM soferi WHERE cont = '"+username+"'");
    rs.next();   
    int cod_sofer = rs.getInt(1);
    
    ResultSet rs2= st.executeQuery("SELECT SUM( suma ) FROM curse WHERE cod_sofer ='" +cod_sofer +"' "+
    		"AND data_factura = '"+ data +"'");
    %>
    <center>
	<h2>Suma facturata la data de <%=data %> este: 
	<% if(rs2.next()){ %>
		<%=rs2.getInt(1)%> lei
	<% } %>
		
	<%-- Curse - tabel --%>
	<h2>Cursele efectuate la data de <%=data %> sunt:</h2>
	<table border="1" width="30%" cellpadding="5">
	<thead>
          <tr>
          	<th>cod_cursa</th>
          	<th>cod_masina</th>
          	<th>nr_km</th>
          	<th>cant_combustibil</th>
          	<th>suma</th>
          	<th>nr_factura</th>
          </tr>
      </thead>
      <tbody>
     	<% ResultSet rs3 = st.executeQuery("SELECT cod_cursa, cod_masina, nr_km, cant_combustibil, suma, nr_factura FROM curse "+
     			"WHERE cod_sofer ="+cod_sofer+" AND data_factura = '"+data+"'");
     	int i=0;
     	while(rs3.next()){
     		%>
     	<tr><%
     		for(i=1;i<=6;i++){
     		 %>
     		 	<td><%=rs3.getObject(i)%></td>
     		<%}}
     	
     	if(i == 0){ %>
     		<td colspan="6"><center>Nu exista curse</center></td>
     	<%}%>
     	</tr>
          </tbody>
	</table>
	</center>
</body>
</html>