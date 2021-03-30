<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabel membri</title>
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
	                    <th colspan="7">Membri</th>
	                </tr>
	                <tr>
	                	<%
	                	ResultSet rs = st1.executeQuery("SELECT column_name FROM information_schema.columns "+
	                			"WHERE table_schema = 'baza' AND table_name = 'membri'");
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
	           	ResultSet rs1 = st1.executeQuery("select * from membri");
	           	while(rs1.next()){
	           		nr_linii++;
	           		%>
	           	<tr><%
	           		for(int i=1;i<=7;i++){
	           		 %>
	           		 	<td><%=rs1.getObject(i)%></td>
	           		<%}
	           	%>
	           	</tr>
	           	<%} %>
		           	<tr>           	
		           		<td>id generat automat</td>
		           		<td><input type="text" name="usertype" value="" /></td>
		           		<td><input type="text" name="nume" value="" /></td>
		           		<td><input type="text" name="email" value="" /></td>
		           		<td><input type="text" name="username" value="" /></td>
		           		<td><input type="text" name="password" value="" /></td>
		           		<td>data de azi</td>
		           		
		           		<td><input type="submit" value="Adauga" /></td>
		           		<td><input type="reset" value="Reset" /></td>
		           	</tr>         	
	            </tbody>
	            </table>
			</form>				
		</div>    
		<br/>
		<%
		String add2 = request.getParameter("usertype");
		String add3 = request.getParameter("nume");
		String add4 = request.getParameter("email");
		String add5 = request.getParameter("username");
		String add6 = request.getParameter("password");
			
			if (add2 == null)
			{}
			else
			{
				Statement st = con.createStatement();
			    int i = st.executeUpdate("insert into membri (usertype,nume,email,username,password,regdate) values('" + add2 + "','" + add3 + "','"+ add4 + "','" + add5 + "','" + add6 + "', CURDATE())");
			    if (i > 0) {
			        out.print("Randul a fost introdus cu succes.");
			    } else {
			    	out.print("Randul nu a fost introdus.");	    
			    }
			}
		%>	
		<h3>Sterge randul unde id = </h3> 
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
			    int j = st.executeUpdate("delete from membri where id = "+nr_rand);
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