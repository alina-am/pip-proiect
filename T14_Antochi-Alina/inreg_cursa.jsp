<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Star Taxi</title>
    <link rel="stylesheet" href="style0.css" />
  </head>
  <%@ page import ="java.sql.*" %>
  <body>
    <div id="logout">
      <p>Cont sofer</p>
      <a href="logout.jsp">Log out</a>
    </div>
    <nav>
      <h1>Star Taxi</h1>
    </nav>
    <br />
    <center>
      <form method="post" action="cursa.jsp">
        <table border="1" width="50%" cellpadding="5">
          <thead>
            <tr>
              <th colspan="3">Introdu cursa:</th>
            </tr>
          </thead>
          <tbody>
          <% 
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root","");
            Statement st = con.createStatement(); 
            String username = session.getAttribute("username").toString(); 
            ResultSet rs= st.executeQuery("SELECT cod_sofer FROM soferi WHERE cont='"+username+"'"); 
            rs.next(); 
          %>
            <tr>
              <td>Cod sofer (preluat automat)</td>
              <td>
                <input type="number" name="cod_sofer"
                value="<%=rs.getInt("cod_sofer") %>" />
              </td>
            </tr>
            <tr>
              <td>Cod masina</td>
              <td><input type="number" name="cod_masina" value="" /></td>
            </tr>
            <tr>
              <td>Numar kilometri</td>
              <td><input type="number" name="nr_km" value="" step="0.01" /></td>
            </tr>
            <tr>
              <td>Cantitate combustibil</td>
              <td>
                <input type="number" name="cant_comb" value="" step="0.01" />
              </td>
            </tr>
            <tr>
              <td>Suma</td>
              <td><input type="number" name="suma" value="" /></td>
            </tr>
            <tr>
              <td>Numar factura (6 cifre)</td>
              <td><input type="number" name="factura" value="" /></td>
            </tr>
            <tr>
              <th colspan="3">
                <input type="reset" value="Reset" />
                <input type="submit" value="Submit" />
              </th>
            </tr>
          </tbody>
        </table>
      </form>
    </center>
  </body>
</html>
