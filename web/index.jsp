<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
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
    <input type="submit" class = "w3-button w3-third" value="Search">
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
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + request.getRealPath("/") + "main.sqlite");
        Statement stat = conn.createStatement();
        ResultSet rs,rs1;
        String idNum = request.getParameter("id");
        String newName = request.getParameter("name");
        String newMail = request.getParameter("email");
        String newTry = request.getParameter("country");
        String add = request.getParameter("add");
        if(newName != null && newMail != null && newTry != null){
            int rs3 = stat.executeUpdate("update data set name = '"+newName+"', email = '"+newMail+"', country = '"+newTry+"' where id == '" + idNum + "';");
            request.setAttribute("name",null);
            request.setAttribute("email",null);
            request.setAttribute("country",null);
            request.removeAttribute("name");
            request.removeAttribute("email");
            request.removeAttribute("country");
        }
        if(idNum != null){
                rs1 = stat.executeQuery("select * from data where id == '"+idNum +"';");
                out.print("<div id=\"id01\" class=\"w3-modal\" style =\"display:block;\">\n" +
                        "<div class=\"w3-modal-content\">\n" +
                        "<div class=\"w3-container\">\n" +
                        "<form>\n" +
                        "<span onclick=\"document.getElementById('id01').style.display='none'\" class=\"w3-button w3-display-topright\">&times;</span>\n" +
                        "<p>Edit</p>\n" +
                        "<p><input type = \"text\" readonly value = \""+rs1.getString("serial")+"\"></p>\n" +
                        "<p><input type = \"text\" name = \"id\" readonly value = \""+rs1.getString("id")+"\"></p>\n" +
                        "<p><input name = \"name\" type = \ntext\" placeholder = \"Name\" value = \""+rs1.getString("name")+"\"></p>\n" +
                        "<p><input name = \"email\" type = \"text\" placeholder = \"Email\"value = \""+rs1.getString("email")+"\"></p>\n" +
                        "<p><input name = \"country\" type = \"text\" placeholder = \"Country\"value = \""+rs1.getString("country")+"\"></p>\n" +
                        "<p><input type = \"submit\" value = \"Edit\"></p>\n" +
                        "</form>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>");
                rs1.close();
        }

        if(add.equals("true")){
            out.print("<div id=\"id01\" class=\"w3-modal\" style =\"display:block;\">\n" +
                    "<div class=\"w3-modal-content\">\n" +
                    "<div class=\"w3-container\">\n" +
                    "<form>\n" +
                    "<span onclick=\"document.getElementById('id01').style.display='none'\" class=\"w3-button w3-display-topright\">&times;</span>\n" +
                    "<p>Edit</p>\n" +
                    "<p><input type = \"text\" name = \"nnid\" placeholder = \"ID\"></p>\n" +
                    "<p><input name = \"nnname\" type = \"text\" placeholder = \"Name\"></p>\n" +
                    "<p><input name = \"nnemail\" type = \"text\" placeholder = \"Email\"></p>\n" +
                    "<p><input name = \"nncountry\" type = \"text\" placeholder = \"Country\"></p>\n" +
                    "<p><input type = \"nnsubmit\" onclick=\"document.getElementById('id01').style.display='none'\" value = \"Edit\"></p>\n" +
                    "</form>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>");
        }
        String nId = null;
        String nName = null;
        String nEmail = null;
        String nCountry = null;
        try {
            nId = request.getParameter("nnid");
            nName = request.getParameter("nnname");
            nEmail = request.getParameter("nnemail");
            nCountry = request.getParameter("nncountry");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(nId != null && nName != null && nEmail != null && nCountry != null){
            int rs4 = stat.executeUpdate("insert into data(id,name,email,country) values ('"+nId+"','"+nName+"','"+nEmail+"','"+nCountry+"')");
        }

        String phrase = request.getParameter("srch");
        rs = stat.executeQuery("select * from data;");
        if(phrase != null){
          rs = stat.executeQuery("select * from data where instr(name, '"+phrase+"') > 0;");
        }
        while (rs.next()) {
            out.println("<form>");
            out.println("<tr>");
            out.println("<td>" + rs.getString("serial") + "</td>");
            out.println("<td><input type=\"text\" readonly name = \"id\"value=\"" + rs.getString("id") + "\"></td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td>" + rs.getString("country") + "</td>");
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
      <form>
          <input type="text" style="display:none;" name = "add" value = "true">
          <input type="submit" class = "w3-button w3-border-black w3-green w3-hover-light-green w3-border-light-green" value="Insert new Record">
      </form>
  </fieldset>
  </body>
</html>
