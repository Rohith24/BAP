<%-- 
    Document   : index
    Created on : 8 Jan, 2017, 11:12:51 AM
    Author     : Pavankumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>BAP</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
    <SCRIPT type="text/javascript">
        window.history.forward();
        function noBack() { window.history.forward(); }
    </SCRIPT>
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
  <div class="form">
      <%
        if(session.getAttribute("HODID")!=null){
            response.sendRedirect("HOD_Classes.jsp");
        }
        if(session.getAttribute("StaffID")!=null){
            response.sendRedirect("Staff_classes.jsp");
        }
      %>
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Login As HOD </a></li>
        <li class="tab"><a href="#login">Log In As Staff</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
			<h1><img alt="bec logo" src = "images/emblum.jpg" height="20%" width="20%" /></h1>
          <form action="Login.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              HOD ID<span class="req">*</span>
            </label>
            <input type="text" required autocomplete="off" name="uname"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="pwd" required autocomplete="off"/>
          </div>
          
          <!--<p class="forgot"><a href="#">Forgot Password?</a></p>-->
          
          <button class="button button-block" id= "hod" name="hod"/>Log In</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1><img src = "images/emblum.jpg" height="20%" width="20%"></img></h1>
          
          <form action="Login.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              Staff ID<span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off" name="uname"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="pwd" required autocomplete="off"/>
          </div>
          
          <!--<p class="forgot"><a href="#">Forgot Password?</a></p>-->
          
          <button class="button button-block" id="staff" name="staff"/>Log In</button>
          <a href="forgotPassword.jsp">Having trouble signing in?</a>
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script src="js/index.js"></script>

</body>
</html>

