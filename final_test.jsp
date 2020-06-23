<%-- 
    Document   : ques.jsp
    Created on : 25 May, 2020, 3:48:11 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%
            

                 try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
               String uname=(String)session.getAttribute("username");
               int i=10;
               int count=0;
           
               
               while(i<=20)
               {
                   String uans=request.getParameter(Integer.toString(i));
               ResultSet rs=s.executeQuery("select ans from test1 where id='"+i+"' ");
                if(rs.next())
                {
                    String correct=rs.getString("ans");
                    if(correct.equals(uans))
                        count++;
                    out.println(correct+" "+uans);
                }
                
                i++;
            }
             //  out.println("Correct answers are "+count);
               count=2*count;
               int sum=(Integer)session.getAttribute("usermarks");
               count=count+sum;
               session.setAttribute("usermarks",count);
               String uemail=(String)session.getAttribute("sessname");
               ResultSet rs=s.executeQuery("select email from result where email='"+uemail+"' ");
                if(rs.next())
                {
                 s.executeUpdate("update result set name='"+uname+"',marks='"+count+"' where email='"+uemail+"'");   
                }
                else {
                s.executeUpdate("insert into result values ('"+uname+"',"+uemail+"','"+count+"')");
                } 
             
               response.sendRedirect("result.jsp");
           }
                 catch(Exception e)
                 {
                   out.println(e); 
                 }
        %>
    </body>
</html>
