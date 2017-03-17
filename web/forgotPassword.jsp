<%-- 
    Document   : forgotPassword
    Created on : 20 Jan, 2017, 10:47:26 AM
    Author     : Pavankumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("InvalidEmail")!=null){
                out.print(session.getAttribute("InvalidEmail"));
                session.removeAttribute("InvalidEmail");
            }
            %>
        <form id="formForgotPassword" action="ForgotPassword" method="post">
            <input name="Email" type="email" id="inputEmail" placeholder="Enter Email" data-error="Enter valid Email" required>
            <input type="submit"/>
        </form>
        
    </body>
</html>
