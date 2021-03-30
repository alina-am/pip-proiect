<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Star Taxi</title>
    <link rel="stylesheet" href="style0.css" />
  </head>
  <body>
    <div id="logout">
      <p>Cont sofer</p>
      <a href="logout.jsp">Log out</a>
    </div>
    <nav>
      <h1>Star Taxi</h1>
    </nav>
    <center>
      <%@ page import ="java.sql.*" %> 
      <%
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root",""); 
      Statement st = con.createStatement(); 
      String cod_sofer = request.getParameter("cod_sofer"); 
      String masina = request.getParameter("cod_masina"); 
      String km = request.getParameter("nr_km"); 
      String comb = request.getParameter("cant_comb"); 
      String suma = request.getParameter("suma"); 
      String factura = request.getParameter("factura"); 
      String data = request.getParameter("data"); 
      
      int i = st.executeUpdate("insert into curse(cod_masina, cod_sofer, nr_km, cant_combustibil, suma, nr_factura, data_factura) "+ 
      "values ('" + masina + "','" + cod_sofer + "','" + km + "','" + comb + "','" + suma + "','" + factura + "', CURDATE() )");
      if (i > 0) { 
    	  out.print("<br />Cursa a fost inregistrata."+"<br /><a href='inreg_cursa.jsp'><br /><a href='sofer.jsp'>Mergi la pagina principala</a>"); 
		} 
      else {
	      out.print("<br />Cursa NU a fost inregistrata. "+"<br /><a href='inreg_cursa.jsp'>Incearca inca o data</a><br /> <a href='sofer.jsp'>Mergi la pagina principala</a>"); 
      }%>
    </center>
  </body>
</html>