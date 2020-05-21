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
  <h4>Project Directory : <%out.print(request.getContextPath());%></h4>
  <h4>Real Directory : <%out.print(request.getRealPath("/"));%></h4><br>
  <br>
  <form>
  <fieldset class = "w3-border">
    <input class = "w3-input w3-border w3-twothird" placeholder="Search Name" type="text" name = "srch">
    <input type="submit" class = "w3-button w3-third">
  </fieldset>
  </form>
  <br>
  <table class = "w3-table w3-border w3-bordered w3-striped">
    <thead>
    <tr>
        <th>Serial No.</th>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <%
        String idNum = request.getParameter("id");
        if(idNum != null){
            out.print("<div id=\"id01\" class=\"w3-modal\" style =\"display:block;\">\n" +
                    "    <div class=\"w3-modal-content\">\n" +
                    "      <div class=\"w3-container\">\n" +
                    "        <span onclick=\"document.getElementById('id01').style.display='none'\" class=\"w3-button w3-display-topright\">&times;</span>\n" +
                    "        <p>Edit</p>\n" +
                    "        <p><input type = \"text\"></p>\n" +
                    "      </div>\n" +
                    "    </div>\n" +
                    "  </div>\n" +
                    "</div>");
        }
        String phrase = request.getParameter("srch");
        Class.forName("org.sqlite.JDBC");
        Connection conn =
                DriverManager.getConnection("jdbc:sqlite:" + request.getRealPath("/") + "main.sqlite");
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery("select * from data;");
        if(phrase != null){
          rs = stat.executeQuery("select * from data where instr(name, '"+phrase+"') > 0;");
        }
        while (rs.next()) {
            out.println("<form>");
            out.println("<tr>");
            out.println("<td>" + rs.getString("serial") + "</td>");
            out.println("<td><input type=\"text\" readonly name = \"id\"value=\"" + rs.getString("id") + "\"></td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("phone") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td><input type = \"submit\" value=\"Edit\"></td>");
            out.println("</tr>");
            out.println("</form>");
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
