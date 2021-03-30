<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inregistrare</title>
<link rel="stylesheet" href="style0.css">
</head>
<body>
	    <nav>
            <h1>Star Taxi</h1>
        </nav>

	<%@ page import ="java.sql.*" %>
	<%
		String usertype = request.getParameter("usertype");
	    String username = request.getParameter("username");    
	    String pwd = request.getParameter("pass");
	    String name = request.getParameter("nume");
	    String email = request.getParameter("email");
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
	    Statement st = con.createStatement();
	    
	    int i = st.executeUpdate("insert into membri(usertype, nume, email, username, password, regdate) "+
	    "values ('" + usertype + "','" + name + "','" + email + "','" + username + "','" + pwd + "', CURDATE())");
	    if (i > 0) {
	        response.sendRedirect("welcome.jsp");
	    } else {
	        response.sendRedirect("index.jsp");
	    }
	%>
</body>
</html>