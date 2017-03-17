<%-- 
    Document   : Home
    Created on : Feb 26, 2017, 7:30:55 PM
    Author     : Pavankumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>
            .b2{
    border-radius: 15px 20px;
    box-shadow: 10px 10px 10px <%--#F8EEE7--%>#ffcc99;
    background:<%-- #43C6DB--%>#99b3e6 ;
    padding: 20px; 
    width: 200px;
    height: 150px; 
    margin-bottom:  20px;
    margin-left:20px;
}
        </style>
    </head>
    <body>
        <form action="Home.jsp" method="post">
        <img src="images/Screenshot (71).png" width="100%" height="250px"/><br/><br/>
        <input type="submit" class="b2" value="CSE"/>
        <input type="submit" class="b2" value="ECE"/>
        <input type="submit" class="b2" value="EEE"/>
        <input type="submit" class="b2" value="ME"/>
        <input type="submit" class="b2" value="CE"/>
        <input type="submit" class="b2" value="CHE"/>
        </form>
    </body>
</html>
