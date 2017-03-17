<%-- 
    Document   : Holidays
    Created on : 24 Jan, 2017, 1:49:35 PM
    Author     : Pavankumar
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="database.DatabaseCon" id="DB"/>
<jsp:useBean id="DS" class="dateop.DateSelection"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Holidays</title>
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
  <style>
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
    <body style="background-color: #D1D0CE">
        <%
            if(session.getAttribute("HODID")==null){
                response.sendRedirect("index.jsp");
            }
            else{
        %>
        <a class="b3" style="margin-left: 70em" href="HOD_Classes.jsp">Back</a><br/>
        <form action="Holidays.jsp" method="POST">
             <h3 style="font-size: 20px">Date Selection</h3> 
             <h2 style="font-size:20px"> From Date:</h2><input id="datepicker1" name="fromDate" /><br/>
             <h2 style="font-size:20px">To Date:</h2><input id="datepicker2" name="toDate" /><hr/>
             <h3 style="font-size: 20px">Reason for Holiday(s)</h3> 
             <h3 style="font-size: 20px">Reason:<textarea name="Reason"></textarea></h3>&nbsp;&nbsp;
            <input class="b3" type="submit" value="Add Holidays"/><hr/>
        </form>            
        <%
                if ( "POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/Holidays.jsp")))
                if(request.getParameter("Reason")!=null&&request.getParameter("fromDate")!=null&&request.getParameter("toDate")!=null){
                    Connection con=DB.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from bec_holidays where date between '"+DS.getSQLDateFromCal(request.getParameter("fromDate"))+"' and '"+DS.getSQLDateFromCal(request.getParameter("toDate"))+"'");
                    int count=0;
                    while(rs.next()){
                        count++;
                    }
                    DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
                    DateFormat d = new SimpleDateFormat("yyyy-mm-dd");
                    try{
                    Date fromDate=df.parse(request.getParameter("fromDate"));               
                    Date toDate=df.parse(request.getParameter("toDate"));
                    
                    if(count==0){
                        while(fromDate.before(toDate)){
                            st.executeUpdate("INSERT INTO `bec`.`bec_holidays`(`Date`,`Reason`) VALUES('"+d.format(fromDate)+"','"+request.getParameter("Reason")+"')");
                            out.println(fromDate+":"+request.getParameter("Reason")+"<br/>");
                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(fromDate);
                            calendar.add(Calendar.DAY_OF_YEAR, 1);
                            fromDate = calendar.getTime();
                            Date dt=new Date();
                            calendar.setTime(dt);
                        }
                    }
                    else{
                        out.println("Already updated");
                    }
                    }
                    catch(Exception ex){
                        
                    }
                }   
                
                Connection con=DB.getConnection();
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from bec_holidays");
                out.print("<h3 style=\"font-size:20px\">Date(yyyy-mm-dd):Reason<br/>");
                while(rs.next()){
                    out.print("<h3 style=\"font-size:20px\">"+rs.getString(2)+" is a &nbsp; "+rs.getString(3)+"<br/></h3>");
                }
            }
        %>
        
    </body>
</html>
