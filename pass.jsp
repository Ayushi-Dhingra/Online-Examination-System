<%-- 
    Document   : pass
    Created on : 19 May, 2020, 10:08:54 PM
    Author     : hp
--%>


<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.*"%>  
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String uemail=request.getParameter("e1");
            String uques=request.getParameter("Q1");
            String uans=request.getParameter("ans");
            String upass=request.getParameter("p1");
             try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
              // out.println("ERROR OCCURED");
               ResultSet rs=s.executeQuery("select * from login where email='"+uemail+"' and security ='"+uques+"' and ans='"+uans+"'");
          if(rs.next())
          {
              //out.println("WORKING");
           s.executeUpdate("update login set pass='"+upass+"' where email='"+uemail+"'" );
       response.sendRedirect("login.html");
        
          }
          else 
          {
             response.sendRedirect("forgot_ques.html");
          }
           }
           catch(Exception e)
           {
               out.println(e);
           }
            
            %>
    </body>
</html>
