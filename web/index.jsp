<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="org.sqlite.JDBC"%>
<html>
  <head>
    <title>Database Project</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head>
  <body>
  <h1 class="w3-bar w3-black">Database Project</h1>
  <h2>Project Directory : <%out.print(request.getContextPath());%></h2>
  <h2>Real Directory : <%out.print(request.getRealPath("/")%></h2>
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
              DriverManager.getConnection("jdbc:sqlite:"+request.getRealPath("/")+"main.sqlite");
      Statement stat = conn.createStatement();

      ResultSet rs = stat.executeQuery("select * from data;");

      while (rs.next()) {
        out.println("<tr>");
        out.println("<td>" + rs.getString("serial") + "</td>");
        out.println("<td>" + rs.getString("id") + "</td>");
        out.println("<td>" + rs.getString("name").replace("kr.","") + " kr.</td>");
        out.println("<td>" + rs.getString("phone") + "</td>");
        out.println("<td>" + rs.getString("email") + "</td>");
        out.println("</tr>");
      }
      rs.close();
      conn.close();
    %>
    </tbody>
  </table>
  </body>
</html>
