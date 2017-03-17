<%-- 
    Document   : Staff_classes
    Created on : 7 Jan, 2017, 11:28:32 AM
    Author     : Pavankumar
--%>

<%@page import="java.util.stream.IntStream"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" class="database.DatabaseCon"/>
<jsp:useBean id="DS" class="dateop.DateSelection"/>
<jsp:useBean id="BAP" class="BAP.BAPOP"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

       
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="js/checkboxreason.js"></script>
        <SCRIPT type="text/javascript">
            window.history.forward();
                function noBack() { window.history.forward(); }
        </SCRIPT>
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

.b2{
    border-radius: 15px 20px;
    box-shadow: 10px 10px 10px #F8EEE7;
    background: #43C6DB;
    padding: 20px; 
    width: 200px;
    height: 150px; 
    margin-bottom:  20px;
}


        </style>
    </head>
    <body style="background-color:#4C787E" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >
        <div class="module form-module">
            <form id="form1" action="Staff_classes.jsp" method="post">
        <%  
            int StaffID=0;
            try{
                  StaffID=Integer.parseInt(session.getAttribute("StaffID").toString());
            }
            catch(Exception ex){}
            Connection con=DB.getConnection();
            Statement st=con.createStatement();
            
            String todayDate="",dayOfWeek="",currDate=null;
            SimpleDateFormat dWF = new SimpleDateFormat("E");
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sqlDF = new SimpleDateFormat("yyyy-mm-dd");
            Date today = new Date();
            String Reason="";
            String prevDate="";
            todayDate=df.format(today);
            
            
            if ( "POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/Staff_classes.jsp"))) {
                if(request.getParameter("currDate")!=null){
                    currDate=request.getParameter("currDate");
                    session.setAttribute("currDate", currDate);
                }
            }
            if(currDate==null)
                if(session.getAttribute("currDate")==null)
                    currDate=todayDate;
                else
                    currDate=session.getAttribute("currDate").toString();
            prevDate=DS.prevWorkingDay(todayDate);
        %>
        <p style="font-size: 20px;color: #FFFFFF">Previous Day: <input class="b3" type="submit" name="currDate" value="<%=prevDate%>"/></p><br/>
            
            
        <p style="font-size: 20px;color: #FFFFFF"> Today: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="b3" type="submit" name="currDate" value="<%=todayDate%>"/><br/></p>
        <input class="b3" style="margin-left:75em" name="logout" type="submit" value="Logout"/><br/><hr/>
        <%
            
            Date myDate = null;
            try{
                myDate=df.parse(currDate);
            }
            catch(Exception ex){
                myDate=null;
            }
            dayOfWeek=dWF.format(myDate);
            out.print("<p style=\"color: #FFFFFF;font-size:20px\">Selected Date:"+dayOfWeek+" ");//Day of the Week
            out.print(currDate+"<br/>");//Current Selected Date
            boolean Holiday=DS.IsHoliday(currDate);
           
            if(!Holiday){
                if(request.getParameter("absentsSubmit")!=null){
                    String absenties=request.getParameter("nums");
                    if(absenties!=null && absenties.matches("[0-9\\s]+(,[0-9\\s]+)*")){
                        RequestDispatcher rd=getServletContext().getRequestDispatcher("/status.jsp");
                        rd.forward(request,response);
                    }
                    else{
                        %>      <script type="text/javascript">
                                    alert("Invalid Format");
                                    
                                </script> 
                        <%
                    }
                }
                if(session.getAttribute("StaffID")==null)
                    response.sendRedirect("index.jsp");
                else{
        %>
           <br/>
           <h3 style="font-size:20px;color: #FFFFFF">Please select section:</h3><br/>
            <ul class="module form-module">
                <%
                    ResultSet rs=st.executeQuery("SELECT d.class_name_id,d.Subject_Name,c.year,h.Dept_Name,c.section FROM bec.bec_dealingclass as d join bec.bec_class as c on d.class_name_id=c.id join bec.bec_hod as h on c.Dept_Name_id=h.id where d.staff_name_id="+StaffID+"");
                    ArrayList<String> ButtonIDs=new ArrayList<String>();
                    while(rs.next()){
                        int classid=rs.getInt(1);
                        String sub=rs.getString(2);
                        String classDet=rs.getInt(3)+rs.getString(4)+rs.getString(5);
                        ButtonIDs.add(classid+"_"+classDet);
                        %>
                        <input style="margin-left: 15px" class="b2" type="submit" name="MyClasses" value="<%= sub+"_"+classDet %>"/>
                        <%   
                    }
                    rs.close();
                    if ( "POST".equalsIgnoreCase(request.getMethod()) && (request.getRequestURI() != null && request.getRequestURI().toString().equalsIgnoreCase("/BAP/Staff_classes.jsp"))) {
                        if(request.getParameter("MyClasses")!=null){
                %>
      </ul>
       <div class="module form-module">
        <div id="signup">   	
            <div class="module form-module">
                <p style="color: #FFFFFF">Choose Period for section:
                        <% 
                            String classDetails=request.getParameter("MyClasses");
                            String Class=classDetails.split("_")[1];
                            out.print(request.getParameter("MyClasses")+"<br/>");
                            session.setAttribute("classDetails", request.getParameter("MyClasses"));
                            Statement stmt=con.createStatement();
                            ResultSet rs2=stmt.executeQuery("select * from cs"+Class.charAt(0)+Class.charAt(Class.length()-1)+"_timetable where Day=UPPER('"+dayOfWeek+"')");
                            int lab_count=0;//if there is a lab then count is 2 otherwise count=1
                            while(rs2.next()){
                                lab_count++;
                            }
                            int[][] todayclasses=new int[lab_count][10];//index 0 have Batch Id and other have period details
                            //int[] todayclasses=new int[10];
                            rs2.beforeFirst();
                            int lc=0;
                            while (rs2.next()) {
                                for(int i=0;i<10;i++){
                                    todayclasses[lc][i]=rs2.getInt(i+3);
                                }
                                lc++;
                            }
                            session.setAttribute("todayClasses", todayclasses);
                            List<Integer> labdetails=new ArrayList<Integer>();//index-0 have Batch id other 3 have period details
                            String BatchQuery=" and Batch=0";
                            if(lab_count==2){
                                labdetails=BAP.getLabDetails(todayclasses,StaffID);
                                session.setAttribute("Batch", labdetails.get(0));
                                session.setAttribute("labdetails", labdetails);
                                BatchQuery=" and Batch="+labdetails.get(0);
                                labdetails.remove(0);
                            }
                            rs=null;
                            String SqlQuery="select * from "+Class+" where Date='"+DS.getSQLDate(currDate)+"'";
                            if(lab_count==2){
                                if(classDetails.contains("LAB")){
                                    SqlQuery+=BatchQuery;
                                }
                                else{
                                    SqlQuery+=" and Batch=1";
                                }
                            }
                            try{
                                rs= stmt.executeQuery(SqlQuery);
                                //out.print(SqlQuery);
                            }catch(Exception ex){
                                stmt.executeUpdate(DB.CreateClassTable(Class));
                                rs= stmt.executeQuery(SqlQuery);
                            }
                            int count=0;
                            int[] periods=new int[10];
                        %>
                            <div class="checkbox">
                            <div class="tag"></div>
                        <%
                            while(rs.next()){
                                count++;
                                for (int i = 1; i < 10; i++) {
                                    periods[i]=rs.getInt(i+2);
                                    if(periods[i]==0||(request.getParameter("MyClasses").contains("LAB")&&labdetails.contains(i))){
                                        
                        %>
                            <input type="checkbox" <%
                                int reas=1;
                                if(request.getParameter("MyClasses").contains("LAB")){
                                    if(labdetails.contains(i)){
                                        out.println("checked");
                                        reas=0;
                                    }
                                }
                                else{
                                    if(!labdetails.contains(i)&&todayclasses[0][i]==StaffID){
                                        out.println("checked");
                                        reas=0;
                                    }
                                }
                            
                        %>  id="input-confidencial<%=i%>" name="p<%=i%>" value = "<%=i%>"><label for="input-confidencial<%=i%>"><%=i%></label>
                            <% if(reas==1) {%>
                            <div id="reasondiv<%=i%>" style="display: none">
                                <input type="text" id="reason<%=i%>" name="reason<%=i%>" placeholder="Reason for change"/>
                            </div>
                            
                        <%
                            }
                                    }
                                    else if(periods[i]!=0){
                                       %>
                            <input type="checkbox" <%
                                        if(!labdetails.contains(i))
                                                out.println("disabled");
                                        
                            
                        %>  id="input-confidencial<%=i%>" name="p<%=i%>" value = "<%=i%>"><label for="input-confidencial<%=i%>"><%=i%></label>
                            <%              if(!labdetails.contains(i)){
                                                Statement sta=con.createStatement();
                                                ResultSet staffRS=sta.executeQuery("select * from bec_staff where id="+periods[i]);
                                                while(staffRS.next()){
                                                    out.print("Class taken by "+staffRS.getString(2)+"<br/>");
                                                }
                                            }
                                    }
                                }
                            }
                            rs.close();
                            if(count==0){
                                for (int i = 1; i < 10; i++) {                                       
                                        %>
                                            <input type="checkbox" <%
                                                if(request.getParameter("MyClasses").contains("LAB")){
                                                    if(labdetails.contains(i))
                                                        out.println("checked");
                                                }
                                                else{
                                                    if(!labdetails.contains(i)&&todayclasses[0][i]==StaffID)
                                                        out.println("checked");
                                                }
                                                
                                        %>  id="input-confidencial<%=i%>" name="p<%=i%>" value = "<%=i%>"><label for="input-confidencial<%=i%>"><%=i%></label>
                                            <div id="reasondiv<%=i%>" style="display: none">
                                                <input type="text" name="reason<%=i%>" id="reason<%=i%>" placeholder="Reason for change"/>
                                            </div>
                                        <%
                                }
                                if(lab_count==2){
                                    stmt.executeUpdate("insert into "+Class+"(Date,Batch) values('"+DS.getSQLDate(currDate)+"',1)");
                                    stmt.executeUpdate("insert into "+Class+"(Date,Batch) values('"+DS.getSQLDate(currDate)+"',2)");
                                }
                                else{
                                    stmt.executeUpdate("insert into "+Class+"(Date) values('"+DS.getSQLDate(currDate)+"')");
                                }
                            }
%>
                            </div>
        <br/><br/>
        <div class="module form-module">
        <p style="color: #FFFFFF;font-size: 20px"> Please specify absenties list in comma sepeated values if no absenties fill with 0</p>
           <textarea id="nums" name="nums"></textarea><br/>
           <br/>
           <input class="b3" id="btn" name="absentsSubmit" type="submit" title="submit"><hr/>
          </div>
        </div>
      </div><!-- tab-content -->
       </div>
      <%
                            
                        }//if close - ButtonID
                    }//IF close
                    
                }//else
            }
            else{
                out.print("<br/><br/>"+currDate+" is Holiday. "+Reason);
            }
            try{
                Statement s=con.createStatement();
                ResultSet rs=s.executeQuery("select * from bec_class where coordinator_id="+StaffID);
                while(rs.next()){
                    out.println("<hr/><br/><br/><p style=\"color:#FFFFFF;font-size:20px\">Coordinating Class:  <a class='b3' href='CoReport.jsp'>"+rs.getString(2)+"CSE"+rs.getString(3)+"</a></p>");
                    session.setAttribute("Class", rs.getString(2)+rs.getString(3));

                }
            }
            catch(Exception ex){
                out.print(ex.getMessage());
            }
            try{
            if(request.getParameter("logout")!=null){
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
            }
            catch(Exception e){}
            con.close();
                %>
            </form>
            <style>
                .button {
    display: block;
    width: 115px;
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
}
            </style>
            
                
                    
        </div> <!-- /form -->
       
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="js/index.js"></script> 
    </body>
</html>
