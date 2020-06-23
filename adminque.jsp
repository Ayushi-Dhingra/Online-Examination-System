<%-- 
    Document   : admintable
    Created on : 28 May, 2020, 11:13:28 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
background-image: radial-gradient(  white,#F0E68C);
border: 30px solid transparent;
  padding: s0px;
  border-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTuMbRwbB76vZNcPsoxX3j19-ULRrZHGtETzfNGVLjiS6m1dILD&usqp=CAU') 50 round;
}

#login {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#login td, #login th {
  border: 1px solid #ddd;
  padding: 8px;
}

#login tr:nth-child(even){background-color: lightblue;}

#login tr:hover {background-color: #ddd;}

#login th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:   #800000;
  color: white;
}

.sidepanel  {
  width: 0;
  position: fixed;
  z-index: 1;
  height: 600px;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidepanel a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidepanel a:hover {
  color: #f1f1f1;
}

.sidepanel .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #111;
  color: white;
  padding: 10px 15px;
  border: none;
}


.openbtn:hover {
  background-color:#444;
}
h1
{
    background: rgba(0,0,0,0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 50px;
    color: green;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
text-align: center;
}
</style>
<script>
function openNav() {
  document.getElementById("mySidepanel").style.width = "350px";
  document.getElementById("main").style.marginLeft = "350px";
}

function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}
</script>
</head>
<body>

<div id="mySidepanel" class="sidepanel">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
  <a href="passa.html">Forgot Password</a>
  <br>
  <a href="admintable.jsp">Details of Login User</a>
  <br>
  <a href="adminque.jsp">List Of Questions</a>
  <br/>
  <a href="resulttable.jsp">Results of the students</a>
  <br>
  <a href="admincontact.jsp">Contact Us Details</a>
  <br>
  <a href="newupdate.html">Change Question</a>
  <br>
  <a href="logout.jsp">Logout</a>
  <br>
</div>
<button class="openbtn" onclick="openNav()">☰ OPTIONS</button>
  <div id="main">
<h1 style="">QUESTION LIST</h1><br>


<%
try
{
Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
                ResultSet rs= s.executeQuery("select * from test1");
                %>
                
<table id="login">
  <tr>
      <th>S.No.</th>
  <th>Question</th>
  <th>Option 1</th>
  <th>Option 2</th>
  <th>Option 3</th>
  <th>Option 4</th>
  <th>Correct Answer</th>
</tr>          <%
while(rs.next())
{

%>
    <tr>
        <td>    <%=rs.getString("id") %></td>
        <td>    <%=rs.getString("ques") %></td>
    <td><%=rs.getString("option1") %></td>
    <td><%=rs.getString("option2") %></td>
    <td><%=rs.getString("option3") %></td>
    <td><%=rs.getString("option4") %></td>
    <td><%=rs.getString("ans") %></td>
    </tr>
    <%

}
%>
      
    </table>
      <br>
    <%
}
    
catch(Exception e)
{
    e.printStackTrace();
    }




%>



</div>


    </body>
</html>
