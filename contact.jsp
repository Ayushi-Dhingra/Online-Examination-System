<%-- 
    Document   : contact
    Created on : 3 Jun, 2020, 7:55:52 AM
    Author     : hp
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
              String ufirst=request.getParameter("firstname");
            String ulast=request.getParameter("lastname");
            String ustate=request.getParameter("States");
            String usubject=request.getParameter("subject");
            
           try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
               s.executeUpdate("insert into contact values ('"+ufirst+"','"+ulast+"','"+ustate+"','"+usubject+"')");
         response.sendRedirect("login.html");
           }
           catch(Exception e)
           {
               out.println(e);
           }
           
            %>
            %>
    </body>
</html>
