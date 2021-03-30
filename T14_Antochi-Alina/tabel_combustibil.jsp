<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabel combustibil</title>
<link rel="stylesheet" href="style0.css">
</head>
<body>
	<div id="logout">
		<p>Cont admin</p>
		<%out.println("<a href='logout.jsp'>Log out</a>");%>
	</div>
	<nav>		
        <h1>Star Taxi</h1>
    </nav>
    <br/>
    <center>
	    <h2><a href="admin.jsp">Inapoi la pagina principala</a></h2>
	    <br/>
	    
	    <%@ page import ="java.sql.*" %>
	    <%
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
	    
	    Statement st1 = con.createStatement();
	%>
		<div class="tabel" id="tabel">
		<form method="post" action="">
			<table border="1" width="30%" cellpadding="5">
				<thead>
	                <tr>
	                    <th colspan="4">Combustibil</th>
	                </tr>
	                <tr>
	                	<%
	                	ResultSet rs = st1.executeQuery("SELECT column_name FROM information_schema.columns "+
	                			"WHERE table_schema = 'baza' AND table_name = 'combustibil'");
	                	while(rs.next()){
	                		%>
	                		<th><%=rs.getString(1)%></th>
	                		<%
	                	}
	                	%>
	                </tr>
	            </thead>
	            <tbody>
	           	<%
	           	int nr_linii = 0;
	           	ResultSet rs1 = st1.executeQuery("select * from combustibil");
	           	while(rs1.next()){
	           		nr_linii++;
	           		%>
	           	<tr><%
	           		for(int i=1;i<=4;i++){
	           		 %>
	           		 	<td><%=rs1.getObject(i)%></td>
	           		<%}
	           	%>
	           	</tr>
	           	<%} %>
		           	<tr>           	
		           		<td>cod generat automat</td>
		           		<td><input type="text" name="nume_comb" value="" /></td>
		           		<td><input type="text" name="unit_masura" value="" /></td>
		           		<td><input type="text" name="cost_unit" value="" /></td>
		           		
		           		<td><input type="submit" value="Adauga" /></td>
		           		<td><input type="reset" value="Reset" /></td>
		           	</tr>         	
	            </tbody>
	            </table>
			</form>				
		</div>    
		<br/>
		<%
			String add2 = request.getParameter("nume_comb");
			String add3 = request.getParameter("unit_masura");
			String add4 = request.getParameter("cost_unit");
			
			if (add2 == null)
			{}
			else
			{
				Statement st = con.createStatement();
			    int i = st.executeUpdate("insert into combustibil (nume_comb,unit_masura, cost_unit) values('" + add2 + "','" + add3 + "','"+ add4 + "')");
			    if (i > 0) {
			        out.print("Randul a fost introdus cu succes.");
			    } else {
			    	out.print("Randul nu a fost introdus.");	    
			    }
			}
		%>	
		<h3>Sterge randul unde cod_comb = </h3> 
		<form method="post" action="">		
			<input type="number" name="nr_rand" value="" />
			<td><input type="submit" value="Sterge" /></td>
		</form>	
		<br/>
		<%
			String nr_rand = request.getParameter("nr_rand");
			
			if (nr_rand == null)
			{}
			else
			{
				Statement st = con.createStatement();
			   	int count2 = 0; 
			    int j = st.executeUpdate("delete from combustibil where cod_comb = "+nr_rand);
			    if (j > 0) {
			        out.print("Au fost sterse "+ ++count2 + " randuri.");
			    } else {
			    	out.print("Randul nu a fost sters.");	    
			    }
			}
		%>	
	</center>
</body>
</html>