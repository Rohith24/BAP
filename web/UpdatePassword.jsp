<%-- 
    Document   : UpdatePassword
    Created on : 20 Jan, 2017, 12:31:25 PM
    Author     : Pavankumar
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" class="database.DatabaseCon"/>
<jsp:useBean id="Login" class="Login.LoginValidation"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body>
        <%
            
                String email=request.getParameter("Email");
                String Key=request.getParameter("key");
                //String[] names= request.getParameterNames();
                String Pass=request.getParameter("pass");
                Connection con=DB.getConnection();
                Statement s=con.createStatement();
                int no=s.executeUpdate("delete from forgotpassword where EmailID='"+email+"' and `Key`='"+Key+"'");
                if(no>0){
                    s.executeUpdate("update bec_staff_login set password='"+Login.getHash(Pass)+"' where username='"+email+"'");
                    out.println("Password Changed");
                }
        %>
    </body>
</html>
