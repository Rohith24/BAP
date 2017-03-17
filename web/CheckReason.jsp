<%-- 
    Document   : CheckReason
    Created on : 19 Jan, 2017, 12:29:42 PM
    Author     : Pavankumar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/newcss.css">
       <link rel="stylesheet" href="css/newcss1.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="DB" class="database.DatabaseCon"/>
        <SCRIPT type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
            function print1() {
            window.print();}

        </SCRIPT>
         <style>
                .button {
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
        <a class="button" href="HOD_Classes.jsp">Back</a><br/>
        <table class="table2" border="1" cellspacing="0">
            <tr >
                <th>ID</th>
                <th>Date</th>
                <th>Class</th>
                <th>Original Staff</th>
                <th>Other Staff</th>
                <th>Period</th>
                <th>Reason</th>
            </tr>
        <% 
        
            Connection con=DB.getConnection();
            Statement s=con.createStatement();
            ResultSet rs=s.executeQuery("SELECT bec_period_change_reason.id,Date,year,section,b.Name,c.Name,Reason,Period FROM bec.bec_period_change_reason join bec.bec_class on bec.bec_period_change_reason.classDetails_id=bec.bec_class.id join bec_staff as b on bec_period_change_reason.staff_id=b.id join bec_staff as c on bec_period_change_reason.other_staff_id=c.id");
            
            
            while(rs.next()){
                out.println("<tr><td>"+rs.getString(1)+
                            "</td><td>"+rs.getString(2)+
                            "</td><td>"+rs.getString(3)+rs.getString(4)+
                            "</td><td>"+rs.getString(5)+
                            "</td><td>"+rs.getString(6)+
                            "</td><td>"+rs.getString(8)+
                            "</td><td>"+rs.getString(7)+"</td></tr>");
                
                
            }
            
        %>
        </table>
    </body>
</html>
