<%-- 
    Document   : sendMail
    Created on : Apr 4, 2016, 8:52:44 AM
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
        <jsp:useBean id="mail" scope="session" class="BAP.Mail" />
        <jsp:setProperty name="mail" property="to" value='<%=request.getAttribute("to") %>' />
        <jsp:setProperty name="mail" property="from" value="Java.Mail.CA@gmail.com" />
        <jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />
        <jsp:setProperty name="mail" property="subject" value='<%=request.getAttribute("subject") %>' />
        <jsp:setProperty name="mail" property="message" value='<%=request.getAttribute("message") %>' />
        
        <%  String to = mail.getTo();
            String result;
            result = mail.sendMail();
            out. println(result);   
        %>
    </body>
</html>
