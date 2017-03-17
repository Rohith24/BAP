<%-- 
    Document   : Modify
    Created on : Feb 20, 2017, 11:00:15 AM
    Author     : Pavankumar
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" class="database.DatabaseCon"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
    $("#datepicker1").datepicker();
  });
  function change(changed){
      var d=document.getElementById("more");
      d.style.display=changed.checked? "Block" : "none";
  }
</script>
<style>
    .b3{
   
       background-color: #43BFC7;
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
    </head>
    <body style="background-color: #D1D0CE">
        <form action="Modify.jsp" method="post">
            <h3 style="font-size:20px" > Regno:<input type="text" name="reg"/></h3><br/>
           <%-- <input type="checkbox" name="changed" id="changed" onclick="change(this);"/>More
            <div id="more" style="display: none">
                <input type="text" name="group"/>
            </div>--%>
            <h3 style="font-size:20px" >Date:<input id="datepicker1" name="date"/></h3><br/>
            <h3 style="font-size:20px" >Subject:<input type="text" name="sub"/></h3><br/>
            <input type="submit" class="b3" value="Update"/>
        </form> 
        <%
           
            DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
            DateFormat d = new SimpleDateFormat("yyyy-mm-dd");
                   
            String reg=request.getParameter("reg");
            String date=request.getParameter("date");
            String sub=request.getParameter("sub");
            
                        if(date!=null){
            Date fromDate=df.parse(date);
           
          String o= d.format(fromDate);
           Connection con=DB.getConnection();
           Statement st=con.createStatement();
           st.executeUpdate("update `"+reg+"` set `"+sub+"`=1 where Date='"+o+"'");
            }
            
            
            %>
    </body>
</html>
