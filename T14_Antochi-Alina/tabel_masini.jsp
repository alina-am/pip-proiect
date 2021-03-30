<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabel masini</title>
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
	                    <th colspan="13">Masini</th>
	                </tr>
	                <tr>
	                	<%
	                	ResultSet rs = st1.executeQuery("SELECT column_name FROM information_schema.columns "+
	                			"WHERE table_schema = 'baza' AND table_name = 'masini'");
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
	           	ResultSet rs1 = st1.executeQuery("select * from masini");
	           	while(rs1.next()){
	           		nr_linii++;
	           		%>
	           	<tr><%
	           		for(int i=1;i<=13;i++){
	           		 %>
	           		 	<td><%=rs1.getObject(i)%></td>
	           		<%}
	           	%>
	           	</tr>
	           	<%} %>
		           	<tr>           	
		           		<td>cod generat automat</td>
		           		<td><input type="text" name="marca" value="" /></td>
		           		<td><input type="text" name="model" value="" /></td>
		           		<td><input type="text" name="an_fabr" value="" /></td>
		           		<td><input type="text" name="serie_sasiu" value="" /></td>
		           		<td><input type="text" name="cod_comb" value="" /></td>
		           		<td><input type="text" name="tarif_km" value="" /></td>
		           		<td><input type="text" name="cap_rezervor" value="" /></td>
		           		<td><input type="text" name="nr_inmatr" value="" /></td>
		           		<td><input type="text" name="data_revizie" value="" /></td>
		           		<td><input type="text" name="nr_rca" value="" /></td>
		           		<td><input type="text" name="nr_casco" value="" /></td>
		           		<td><input type="text" name="nr_km" value="" /></td>
		           		
		           		<td><input type="submit" value="Adauga" /></td>
		           		<td><input type="reset" value="Reset" /></td>
		           	</tr>         	
	            </tbody>
	            </table>
			</form>
		</div>
		<br/>	    
		<%
			String add2 = request.getParameter("marca");
			String add3 = request.getParameter("model");
			String add4 = request.getParameter("an_fabr");
			String add5 = request.getParameter("serie_sasiu");
			String add6 = request.getParameter("cod_comb");
			String add7 = request.getParameter("tarif_km");
			String add8 = request.getParameter("cap_rezervor");
			String add9 = request.getParameter("nr_inmatr");
			String add10 = request.getParameter("data_revizie");
			String add11 = request.getParameter("nr_rca");
			String add12 = request.getParameter("nr_casco");
			String add13 = request.getParameter("nr_km");
			
			
			if (add2 == null)
			{}
			else
			{
				Statement st = con.createStatement();
			    int i = st.executeUpdate("insert into masini (marca,model,an_fabr,serie_sasiu,cod_comb,tarif_km,cap_rezervor,nr_inmatr,data_revizie,nr_rca,nr_casco,nr_km) "+
			   	"values('" + add2 + "','" + add3 + "','"+ add4 + "','" + add5 + "','"+ add6 + "','"+ add7 + "','"+ add8 + "','"+ add9 + "','"+ add10 + "','"+ add11 + "','"+ add12 + "','"+ add13 +"')");
			    if (i > 0) {
			        out.print("Randul a fost introdus cu succes.");
			    } else {
			    	out.print("Randul nu a fost introdus.");	    
			    }
			}
		%>
		
		<h3>Sterge randul unde cod_masina = </h3> 
		<form method="post" action="">		
			<input type="number" name="nr_rand" value="" />
			<input type="submit" value="Sterge" />
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
			    int j = st.executeUpdate("delete from masini where cod_masina = "+nr_rand);
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