<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style0.css">
        <title>Inregistrare</title>
    </head>
    <body>
   	<nav>
        <h1>Star Taxi</h1>
    </nav>
    <br/>
    <center>
	    <form method="post" action="registration.jsp">
	        <table border="1" cellpadding="5">
	            <thead>
	                <tr>
	                    <th colspan="3">Introdu informatiile:</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>Nume complet</td>
	                    <td><input type="text" name="nume" value="" /></td>
	                </tr>
	                <tr>
	                    <td>Email</td>
	                    <td><input type="email" name="email" value="" /></td>
	                </tr>
	                <tr>
	                    <td>Tip user</td>
	                    <td>
	                     <input type="radio" name="usertype" value="admin" id="adm" />
	                     <label for="adm">admin</label>
	                     
	                     <input type="radio" name="usertype" value="manager" id="mng" />
	                     <label for="manager">manager</label>
	                     
	                     <input type="radio" name="usertype" value="sofer" id="sfr" checked/>
	                     <label for="sfr">sofer</label>
	                    </td>
	                </tr>
	                <tr>
	                    <td>Nume utilizator</td>
	                    <td><input type="text" name="username" value="" /></td>
	                </tr>
	                <tr>
	                    <td>Parola</td>
	                    <td><input type="password" name="pass" value="" /></td>
	                </tr>
	                <tr> 
	                <th colspan="3"> <input type="submit" value="Submit" />   <input type="reset" value="Reset" /></th> 
	                </tr>
	                <tr>
	                    <td colspan="2">Ai deja cont? <a href="index.jsp">Login</a></td>
	                </tr>
	            </tbody>
	        </table>
	    </form>
	</center>
    </body>
</html>
