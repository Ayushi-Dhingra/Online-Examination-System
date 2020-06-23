<%-- 
    Document   : web2
    Created on : 16 May, 2020, 6:58:36 PM
    Author     : hp
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        
        String uemail=request.getParameter("e1");
        //session.setAttribute("sessname",uemail); 
        String upass=request.getParameter("p1");
          try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
              ResultSet rs= s.executeQuery("select * from adminsign where email='"+uemail+"'and password='"+upass+"'");
              if(rs.next())
              {
         // out.println("DATA SAVED SUCCESSFULLY");
                  response.sendRedirect("admin_home.html");
              }
              else
              {
               response.sendRedirect("admin_pass.html");
           }
           }
           catch(Exception e)
           {
               out.println(e);
           }
            
        %>
        
</html>
