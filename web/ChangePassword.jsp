<%-- 
    Document   : ChangePassword
    Created on : Feb 14, 2017, 2:47:08 PM
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
        <h6 style="font-size: 20px">Update Password</h6>
        <%
            String newpass=request.getParameter("pass");
            out.println("<form action='ChangePassword.jsp' method='post'>");
            out.println("<h3 style=\"font-size: 20px\">Password:<input type='password' name='pass' required/></h3>");
            out.println("<h3 style=\"font-size: 20px\">Confirm Password:<input type='password' name='pass' value='' required/>");
            out.println("<input class=\"b3\" type='Submit' value='Update'/></form>");
            Connection con=DB.getConnection();
                Statement s=con.createStatement();
                
                int HODID=Integer.parseInt(session.getAttribute("HODID").toString());
                if(newpass!=""){
                    s.executeUpdate("update bec_hod_login set password='"+Login.getHash(newpass)+"' where hod_id="+HODID);
                }
                
            %>
    </body>
</html>
