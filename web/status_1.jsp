<%-- 
    Document   : status
    Created on : 5 Jan, 2017, 3:45:15 PM
    Author     : Pavankumar
--%>

<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DS" class="dateop.DateSelection"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       

        <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
        function print1() {
        window.print();}
       
</SCRIPT>
    <link rel="stylesheet" href="css/newcss1.css"/>
    </head>
    <body style="background-color: #D1D0CE" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
         <%@ page import="java.util.*" %>
         <%@ page import="javax.sql.*" %>
         <%@ page import="java.sql.*"%>
         <%@page import="java.text.SimpleDateFormat" %>
         <jsp:useBean id="DB" class="database.DatabaseCon"/>
         
         <style>
         .button {
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
    
  
    }</style>
         <a class="button" href="Staff_classes.jsp">Back</a>
         
     <% 
        
        Connection con=null;
        Statement s=null;
        ResultSet rs=null,rs1=null;
        java.sql.PreparedStatement pst=null;
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String currDate = df.format(new java.util.Date());
        if(session.getAttribute("currDate")!=null){
            currDate=session.getAttribute("currDate").toString();
        }
        String SqlQuery="";
        try{
            int StaffID=Integer.parseInt(session.getAttribute("StaffID").toString());
            String[] classDetails=session.getAttribute("classDetails").toString().split("_");
            int Batch=0;
            String BatchQuery=" and Batch=";
            if(classDetails[0].contains("LAB")){
                Batch=Integer.parseInt(session.getAttribute("Batch").toString());
                BatchQuery+=session.getAttribute("Batch").toString();
            }
            
            String Class=classDetails[1];
            int ClassID=0;
            out.print("<p style=\"color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;\">Selected Class"+classDetails[0]+"_"+Class+"</p><br/>");
            con = DB.getConnection();
            s=con.createStatement();
            int year=Integer.parseInt(Class.valueOf(Class.charAt(0)));
            ResultSet r=s.executeQuery("select * from bec_class where year="+year+" and dept_Name_id=1 and section='"+Class.charAt(Class.length()-1)+"'");
            while(r.next()){
                ClassID=r.getInt(1);
            }
            String str=request.getParameter("nums");
            String[] rollnostr=str.split(",");
            ArrayList<Integer> periodlist=new ArrayList <Integer>();
            int[][] todayclass=(int[][])session.getAttribute("todayClasses");
            out.print("<p style=\"font-family: 'Muli', sans-serif; margin-bottom: 15px;\" >Selected Period(s):");
           
            for (int i = 1; i < 10; i++) {
                try{
                    periodlist.add(Integer.parseInt(request.getParameter("p"+i)));
                    if(Batch==2){
                        if(todayclass[1][i]!=StaffID){
                            r=s.executeQuery("insert into bec_period_change_reason(Date, Reason, classDetails_id, staff_id,other_staff_id,Period) VALUES('"+DS.getSQLDate(currDate)+"','"+
                                    request.getParameter("reason"+i)+"',"+ClassID+","+todayclass[1][i]+","+StaffID+","+i+")");
                        }   
                    }
                    else{
                        if(todayclass[0][i]!=StaffID){
                            try{
                                
                                s.executeUpdate("insert into bec_period_change_reason(Date, Reason, classDetails_id, staff_id,other_staff_id,Period) VALUES('"+DS.getSQLDate(currDate)+"','"+
                                    request.getParameter("reason"+i)+"',"+ClassID+","+todayclass[1][i]+","+StaffID+","+i+")");
                        
                            }catch(Exception ex){
                                out.print(ex.getMessage());
                            }
                        }
                    }
                }
                catch(Exception ex){
                    
                }
            }
            Integer[] periods = periodlist.toArray(new Integer[periodlist.size()]);
            int affected=0;
            for (int i = 0; i < periods.length; i++) {
                out.print(periods[i]+",");
                SqlQuery="update "+Class+" set p"+periods[i]+"="+StaffID+" where Date='"+DS.getSQLDate(currDate)+"'";
                if(classDetails[0].contains("LAB")){
                    SqlQuery+=BatchQuery;
                }
                affected+=s.executeUpdate(SqlQuery);
            }
            //out.print("________"+affected+"_______"+periods.length);
            int affectedperiods=periods.length;
            List<Integer> labdetails=(List<Integer>)session.getAttribute("labdetails");
            if(!classDetails[0].contains("LAB")&&labdetails!=null){
                   affectedperiods+=periods.length;
                }
            if(affected==affectedperiods){
            out.println("<br/><b >Absents List:</b><br/>");
            %>
            <table border="1"  class="table2"  cellspacing="0">
                <tr>
                    <th>Name</th>
                    <th>Reg_Num</th>
                    <th>Roll No</th>
                </tr>
            <%
            for (int i = 0; i < rollnostr.length; i++) {
                int rollNO=Integer.parseInt(rollnostr[i]);
                SqlQuery="select * from bec_student where RollNo='"+rollNO+"' and classDetails_id="+ClassID;
                if(classDetails[0].contains("LAB")){
                    SqlQuery+=BatchQuery;
                }
                rs=s.executeQuery(SqlQuery);
                while(rs.next()){
                    out.println("<tr><td>"+rs.getString(2)+"</td>");
                    String reg_num=rs.getString(3).trim();
                    out.println("<td>"+reg_num+"</td>");
                    out.println("<td>"+rs.getInt(4)+"</td></tr>");
                    Statement stmt=con.createStatement();
                    int update=0;
                    try{
                        //for (int j  = 0; j < periods.length; j++) {
                        update=stmt.executeUpdate("update "+reg_num+" set `"+classDetails[0]+"`=`"+classDetails[0]+"`+0 where Date='"+DS.getSQLDate(currDate)+"'");
                        if(update==0){
                            int insert=stmt.executeUpdate("insert into "+reg_num+"(Date,`"+classDetails[0]+"`) values('"+DS.getSQLDate(currDate)+"',0)");
                        }
                        //}
                    }
                    catch(Exception e){
                        stmt.execute(DB.getCreateStmt(reg_num,ClassID));
                        stmt.execute("insert into "+reg_num+"(Date,`"+classDetails[0]+"`) values('"+DS.getSQLDate(currDate)+"',0)");
                    }
                    //out.println("");
                }
                rs.close();
            }
            %><br/>
                </table><b style="font-family: 'Muli', sans-serif; margin-bottom: 15px;">Present List:</b><br/>
                <br/><table border='1' class="table2" cellspacing="0"  >
                    <tr>
                        <th>Name</th>
                        <th>Reg_Num</th>
                        <th>Roll No</th>
                    </tr>
            <%
            String rollnos="";
            for (int i = 0; i < rollnostr.length; i++) {
                if(i!=rollnostr.length-1)
                    rollnos+=rollnostr[i]+",";
                else
                    rollnos+=rollnostr[i];
                int rollNO=Integer.parseInt(rollnostr[i]);
            }
            SqlQuery="select * from bec_student where RollNo NOT IN("+rollnos+") and classDetails_id="+ClassID;
            if(classDetails[0].contains("LAB")){
                SqlQuery+=BatchQuery;
            }
            rs=s.executeQuery(SqlQuery);
            while(rs.next()){
                out.println("<tr><td>"+rs.getString(2)+"</td>");
                String reg_num=rs.getString(3).trim();
                out.println("<td>"+reg_num+"</td>");
                out.println("<td>"+rs.getInt(4)+"</td></tr>");
                Statement stmt=con.createStatement();
                int update=0;
                try{
                    update=stmt.executeUpdate("update "+reg_num+" set `"+classDetails[0]+"`=`"+classDetails[0]+"`+"+periods.length+" where Date='"+DS.getSQLDate(currDate)+"'");
                    if(update==0){
                     int insert=stmt.executeUpdate("insert into "+reg_num+"(Date,`"+classDetails[0]+"`) values('"+DS.getSQLDate(currDate)+"',"+periods.length+")");
                    }
                }
                catch(Exception e){
                    stmt.execute(DB.getCreateStmt(reg_num,ClassID));
                    stmt.executeUpdate("insert into "+reg_num+"(Date,`"+classDetails[0]+"`) values('"+DS.getSQLDate(currDate)+"',"+periods.length+")");
                }
            }
            rs.close();
            con.close();
            }
            else{
                out.println("Already Updated");
            }
        }
        catch(Exception ex){
            out.print(ex.getMessage());
        } finally{
            
        }
     %>
     
     </table>
     <input type="button" class="button" onclick="print1();" value="Print" style="background-color: #179b77"/>
   
</html>