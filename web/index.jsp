<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<html>
  <head>
    <title>Database Project</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
  <body>
  <h1 class="w3-bar w3-black">Database Project</h1>
  <h2>Project Directory : <%out.print(request.getContextPath());%></h2><br>
  <h2>Real Directory : <%out.print(request.getRealPath("/"));%></h2><br>
  <br>
  <fieldset class = "w3-border">
    <input class = "w3-input w3-border" placeholder="Search" type="text">
  </fieldset>
  <br>
  <table class = "w3-table w3-border w3-bordered w3-striped">
    <thead>
    <tr>
      <th>Serial No.</th>
      <th>ID</th>
      <th>Name</th>
      <th>Phone</th>
      <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <%
        Class.forName("org.sqlite.JDBC");
        Connection conn =
                DriverManager.getConnection("jdbc:sqlite:" + request.getRealPath("/") + "main.sqlite");
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery("select * from data;");

        while (rs.next()) {
          out.println("<tr>");
          out.println("<td>" + rs.getString("serial") + "</td>");
          out.println("<td>" + rs.getString("id") + "</td>");
          out.println("<td>" + rs.getString("name") + "</td>");
          out.println("<td>" + rs.getString("phone") + "</td>");
          out.println("<td>" + rs.getString("email") + "</td>");
          out.println("</tr>");
        }
        rs.close();
        conn.close();
    %>
    </tbody>
  </table>
  <fieldset class = "w3-border-0">
    <button class = "w3-button w3-border-black w3-green w3-hover-light-green w3-border-light-green">Insert new record</button>
  </fieldset>
  </body>
</html>
