<%-- 
    Document   : web
    Created on : 16 May, 2020, 4:01:54 PM
    Author     : hp
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <body>
        <%
            String uemail=request.getParameter("id");
            String upass=request.getParameter("p1");
            String uname=request.getParameter("Name");
            String uques=request.getParameter("Q1");
            String uans=request.getParameter("answer");
            
           try
           {
               
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
               String strQuery = "SELECT COUNT(*) FROM adminsign where email='"+uemail+"'";
                 ResultSet rs = s.executeQuery(strQuery);
                  rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
 s.executeUpdate("insert into adminsign values ('"+uemail+"','"+upass+"','"+uname+"','"+uques+"','"+uans+"')");
         response.sendRedirect("logina.html");
}
else{
    %>
   <p> <center>
    <%
out.println(" Email ID already exists !");
}
%>
    </center></p>
<%
               
           
  
              
           }
           catch(Exception e)
           {
               out.println(e);
           }
           
            %>
            
    </body>
</html>
