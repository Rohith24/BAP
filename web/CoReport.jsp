<%-- 
    Document   : Report
    Created on : 18 Jan, 2017, 9:48:32 AM
    Author     : Pavankumar
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="DB" class="database.DatabaseCon"/>
<jsp:useBean id="BAP" class="BAP.BAPOP"/>
<jsp:useBean id="DS" class="dateop.DateSelection"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <!--<link rel="stylesheet" href="css/newcss1.css"/>-->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker1").datepicker();
  });
  $(document).ready(function() {
    $("#datepicker2").datepicker();
  });
  function openNav() {
    document.getElementById("mySidenav").style.display = "block";
}

function closeNav() {
    document.getElementById("mySidenav").style.display = "none";
}
  </script>
<SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
            function print1() {
            window.print();}

        </SCRIPT>
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
    background-color:#111;
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
            <%--gafgkj--%>
            .b3{
   
    background-color: #2388BF;
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
        
    </head>
    <body style="background-color: #D1D0CE" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        <div >
         <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Staff_classes.jsp">Back to Classes</a>
  <a href="Login.jsp" >Log Out</a>
  <a href="Login.jsp"> Log in as HOD</a>
  
</div>


<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Options</span>
        <a class="b3" style="margin-left:60em" href="Staff_classes.jsp">Back</a>
        <h3 style="font-size: 20px">Actions</h3>
       
        <a class="b3" href="MissedClasses.jsp">Missed Classes</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
       
    <%
        Connection con=DB.getConnection();
        Statement stmt=con.createStatement();
        ResultSet rs=null;
        String currClass=session.getAttribute("Class").toString();
        String fromDate=DS.getSQLDateFromCal(request.getParameter("fromDate"));
        String toDate=DS.getSQLDateFromCal(request.getParameter("toDate"));
        
    %><hr/>
    <h3 style="font-size: 20px">Reports</h3>
    <p style="font-size: 20px">Coordinating Class:<%=currClass%></p>
    
    <form action="CoReport.jsp" method="post">
        Form Date:<input id="datepicker1" name="fromDate" value="<%=(request.getParameter("fromDate")==null)?new String():request.getParameter("fromDate")%>"/>
        TO Date:<input id="datepicker2" name="toDate" value="<%=(request.getParameter("toDate")==null)?new String():request.getParameter("toDate")%>"/>
        Percentage: <select name="percentage">
            <option value="0">All</option>
            <option value="90">&gt;90</option>
            <option value="75">&gt;=75</option>
            <option value="70">&lt;75 and &gt;=65</option>
            <option value="65">below 65</option>
        </select>
        <input class="b3" type="submit" value="submit"/>
        <%
            if("POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/CoReport.jsp")))
            if(request.getParameter("fromDate")==null){
        %>      <script type="text/javascript">
                    alert("Please Select From Date");
                </script> 
        <%
            }
            else if(request.getParameter("toDate")==null){
        %>      <script type="text/javascript">
                    alert("Please Select To Date");
                </script> 
        <%
            }
            else if(request.getParameter("fromDate")!=null && request.getParameter("toDate")!=null){            
        %>
        <%@include file="ClassReport.jsp" %>
        <%}%>
    </form>
        </div>
</body>
</html>