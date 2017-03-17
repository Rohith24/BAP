<%-- 
    Document   : HOD_Classes
    Created on : 8 Jan, 2017, 10:24:29 AM
    Author     : Pavankumar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="database.DatabaseCon" id="DB"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSE</title>
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

       
        <SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
            function openNav() {
    document.getElementById("mySidenav").style.display = "block";
}

function closeNav() {
    document.getElementById("mySidenav").style.display = "none";
}
        </SCRIPT>
    </head>
    <body  onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
         <style>
             body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    display: none;
    height: 100%;
    width: 250px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color:#99b3e6;
    overflow-x: hidden;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
             <%--JDSBJWHBSB --%>
             .backs{
                 <%--background-image: url(images/back2.png);--%>
                 background-color:#111 <%--#4C787E--%>;
               background-repeat: no-repeat;
               background-size: 1400px 800px;
             
             }
                .button {
    display: block;
    width: 115px;
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
}
.b2{
    border-radius: 15px 20px;
    box-shadow: 10px 10px 10px <%--#F8EEE7--%>#ffcc99;
    background:<%-- #43C6DB--%>#99b3e6 ;
    padding: 20px; 
    width: 200px;
    height: 150px; 
    margin-bottom:  20px;
}

.b3{
   
    background-color: <%--#43BFC7--%>#99b3e6;
     box-shadow: 5px 5px 5px #F8EEE7;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius:15px;
    
}
            </style>
           
       
        <% 
            if ( "POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/HOD_classes.jsp"))) {
                if(request.getParameter("logout")!=null){
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                }
                else if(request.getParameter("classes")!=null){
                    session.setAttribute("sltClass", request.getParameter("classes"));
                    response.sendRedirect("ClassSummary.jsp");
                }
            }
            else if(session.getAttribute("HODID")==null)
                response.sendRedirect("index.jsp");
            else{
        %>
        <form method="post" action="HOD_Classes.jsp" >
            <div>
                <img src="images/Screenshot (71).png" width="100%" height="250px"/>
                
                <%--<marquee> <h6 style="font-size: 40px;color: #C2B280">Welcome!You are logged in as HOD</h6></marquee><br/><br/>
                --%>
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a  href="Report.jsp">Reports</a>
             <a  href="CheckReason.jsp">Substitutions</a>
             <a  href="Holidays.jsp">Add Holidays</a>
             <a href="index.jsp">Log in as Staff</a>
             <a href="ChangePassword.jsp">Change Password</a>
             <a href="Modify.jsp">Modify-Attendance</a>
               
        
                  </div>

<span style="font-size:30px;cursor:pointer;color: #3366cc" onclick="openNav()">&#9776; Actions</span>
                <input class="b3" style="margin-left:75em" name="logout" type="submit" value="Logout"/>
                <hr/>
            </div>
                <h6 style="color: <%--#E7DFDD--%>#193366;font-size: 30px">Classes Available in CSE Department</h6><br/>   
           
        
            <%
                int HODID=Integer.parseInt(session.getAttribute("HODID").toString());
                Connection con=DB.getConnection();
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select c.id,c.year,c.section,c.coordinator_id from bec_class as c join bec_hod as h on c.Dept_Name_id=h.id where h.id="+HODID);
                while(rs.next()){
                    int id=rs.getInt(1);
                    String cls=rs.getInt(2)+rs.getString(3);
            %>
           
            <input type="submit" class="b2" name="classes" id="<%=id%>" value="<%=cls %>"/> &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
            <%
                }
                rs.close();
                }

            %>
            <hr/>
           <%--
            <h6 style="color: #E7DFDD;font-size: 30px">Other Actions</h6><br/>
            &nbsp;&nbsp; <a class="b3" href="Report.jsp">Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;
             <a class="b3" href="CheckReason.jsp">Substitutions</a>&nbsp;&nbsp;&nbsp;&nbsp;
             <a class="b3" href="Holidays.jsp">Add Holidays</a>&nbsp;&nbsp;&nbsp;&nbsp;
           --%>
        </form>
    </body>
</html>
