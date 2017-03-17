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
  </script>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
        function print1() {
        window.print();}
       
</SCRIPT>
    </head>
    <body style="background-color: #D1D0CE" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        
    <%
        String currClass=request.getParameter("sltClass");
        String fromDate=DS.getSQLDateFromCal(request.getParameter("fromDate"));
        String toDate=DS.getSQLDateFromCal(request.getParameter("toDate"));
        int HODID=0;
        if(session.getAttribute("HODID")==null)
                response.sendRedirect("index.jsp");
        else{
            HODID=Integer.parseInt(session.getAttribute("HODID").toString());
        }
        Connection con=DB.getConnection();
        Statement stmt=con.createStatement();
        ResultSet rs=null;
        String str=request.getParameter("fromDate");
        //out.print(str+"__"+request.getParameter("toDate"));
        rs=stmt.executeQuery("select year,SECTION from bec_class where Dept_Name_id="+HODID);
    %>
    <a class="b3" href="HOD_Classes.jsp">Back</a>
    <h3 style="font-size: 20px">Date Selection</h3>
    <form   action="Report.jsp" method="post">
        <p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;" >
            From Date:<input id="datepicker1" placeholder="mm/dd/yyyy" name="fromDate" value="<%=(request.getParameter("fromDate")==null)?new String():request.getParameter("fromDate")%>"/></p><br/>
        <p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;" >
            To Date:<input id="datepicker2" name="toDate" placeholder="mm/dd/yyyy" value="<%=(request.getParameter("toDate")==null)?new String():request.getParameter("toDate")%>"/></p>
        <hr/>
       <h3 style="font-size: 20px">Section&Pencentage Selection</h3> 
    Section:<select style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;" name="sltClass">
        <option value="Class">--Select--</option>
        <%
            while(rs.next()){
                int year=rs.getInt(1);
                String section=rs.getString(2);
                String sel=((year+section).equals(currClass))?new String("selected"):new String();
                out.println("<option value='"+year+section+"'"+sel+">"+year+section+"</option>");
            }
        %>
    </select>
         Percentage: <select name="percentage">
            <option value="0">All</option>
            <option value="90">&gt;90</option>
            <option value="75">&gt;=75</option>
            <option value="70">&lt;75 and &gt;=65</option>
            <option value="65">below 65</option>
        </select>
        <style>
         .button {
    display: block;
    width: 115px;
    height: 25px;
    background: #80ff80;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    
  
    }         .b3{
   
    background-color: #2388BF;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius:15px;
    
}</style>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input class="b3" type="submit" value="submit"/>
    <%
        if("POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/Report.jsp")))
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
        else if(request.getParameter("sltClass")!=null && request.getParameter("sltClass").equalsIgnoreCase("Class")){
    %>      <script type="text/javascript">
                alert("Please Select Class");
            </script> 
    <%
        }
        else if(request.getParameter("sltClass")!=null && request.getParameter("fromDate")!=null && request.getParameter("toDate")!=null){            
    %>
    <%@include file="ClassReport.jsp" %>
    <%}%>
</form>
</body>
</html>