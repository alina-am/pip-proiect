<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Login</title>
    <link rel="stylesheet" href="style0.css" />
  </head>
  <body>
    <nav>
      <h1>Star Taxi</h1>
    </nav>
    <center>
    <br />
    <%@ page import ="java.sql.*" %>
    <%
      String username = request.getParameter("username");
      String pwd = request.getParameter("pass");    
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("select * from membri where username='" + username + "' and password = '" + pwd + "'");
      if (rs.next()) 
      {	  
          ResultSet ut = st.executeQuery("select usertype from membri where username='" + username + "'");
          ut.next();
          String usertype = ut.getString("usertype");
          
          session.setAttribute("usertype", usertype);
          session.setAttribute("username", username);
          
          out.println("Buna " + username + "\n, esti logat cu drepturi de "+ usertype + ".");
          out.println("<a href='logout.jsp'>Log out</a>");
          response.sendRedirect("success.jsp");
      }
      else {
          out.println("Numele de utilizator sau parola sunt invalide<br/><a href='index.jsp'>Incearca din nou</a>");
      }
    %>
    </center>
  </body>
</html>
