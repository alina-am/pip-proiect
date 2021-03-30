<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Star Taxi</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <nav>
      <h1>Star Taxi</h1>
    </nav>
    <br />
    <center>
      <form method="post" action="login.jsp">
        <table border="1" cellpadding="3">
          <thead>
            <tr>
              <th colspan="2">Login</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Nume utilizator</td>
              <td><input type="text" name="username" value="" /></td>
            </tr>
            <tr>
              <td>Parola</td>
              <td><input type="password" name="pass" value="" /></td>
            </tr>
            <tr>
              <td></td>
              <td>
                <input type="submit" value="Login" />
                <input type="reset" value="Reset" />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                Nu aveti cont? <a href="reg.jsp">Inregistrati-va aici</a>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </center>
  </body>
</html>
