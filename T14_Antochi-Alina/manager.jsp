<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Star Taxi</title>
    <link rel="stylesheet" href="style-manager.css" />
  </head>
  <%@ page import ="java.sql.*" %>
  <body>
    <div id="logout">
      <p>Cont manager</p>
      <a href="logout.jsp">Log out</a>
    </div>
    <nav>
      <h1>Star Taxi</h1>
    </nav>
    <br />
    <% 
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/baza","root", "");
    	Statement st = con.createStatement(); 
     %>
    <h3>Vezi rapoarte:</h3>

    <%-- Raport1 --%>
    <div class="raport" id="div1">
      <form method="post" action="raport1.jsp">
        <p>Numar curse si km efectuate de soferul:</p>
        <% 
        ResultSet rs1 = st.executeQuery("select nume_prenume from soferi");
        int i=0; 
        while(rs1.next()){ 
        	String s=rs1.getString(1); 
        	%>
        <input type="radio" name="sofer" value="<%=s%>" id="sofer<%=++i%>"/>
        <label for="<%=i%>"><%=s%></label>
        <br />
        <%} %>
        <br />
        <label for="data">Data:</label>
        <input type="date" name="data1" value="2020-05-28" id="data" />
        <br /><br />
        <input type="submit" value="Vezi raport sofer" />
      </form>
    </div>

    <%-- Raport2 --%>
    <div class="raport" id="div2">
      <form method="post" action="raport2.jsp">
        <p>Combustibil consumat de masina:</p>
        <% 
        ResultSet rs2 = st.executeQuery("select cod_masina, marca, model from masini"); 
        int j=0; 
        int id; 
        String marca, model, masina;
        
        while(rs2.next()){ 
        	id = rs2.getInt(1); 
		marca=rs2.getString(2);
        	model=rs2.getString(3); 
		masina = marca+ ' '+model; 
	%>
        <input type="radio" name="masina" value="<%=id%>" id="masina<%=++j%>"/>
	<label for="masina<%=j%>"><%=masina%></label>
	<br />
        <%} %>
        <br />
        <label for="data">Data:</label>
        <input type="date" name="data2" value="2020-05-28" id="data" />
        <br />
        <br />
        <input type="submit" value="Vezi raport masina" />
      </form>
    </div>

    <%-- Raport3 --%>
    <div class="raport" id="div3">
      <form method="post" action="raport3.jsp">
        <p>Total combustibil consumat la data:</p>

        <label for="data">Data:</label>
        <input type="date" name="data3" value="2020-05-28" id="data" />
        <br /><br />
        <input type="submit" value="Vezi raport" />
      </form>
    </div>

    <%-- Raport4 --%>
    <div class="raport" id="div4">
      <form method="post" action="raport4.jsp">
        <p>Total combustibil consumat in perioada:</p>

        <label for="data1">Data 1:</label>
        <input type="date" name="data41" value="2020-05-26" id="data1" />
        <br /><br />

        <label for="data2">Data 2:</label>
        <input type="date" name="data42" value="2020-05-28" id="data2" />
        <br /><br />

        <input type="submit" value="Vezi raport" />
        <br />
      </form>
    </div>
  </body>
</html>
