<%-- 
    Document   : ClassSummary.jsp
    Created on : 8 Jan, 2017, 12:23:15 PM
    Author     : Pavankumar
--%>

<%@page import="java.util.AbstractList"%>
<%@page import="java.util.Dictionary"%>
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
<jsp:useBean id="BAP" class="BAP.BAPOP"/>
<!DOCTYPE html>
<%
    String currClass="";
    if(session.getAttribute("sltClass")==null){
        response.sendRedirect("HOD_Classes.jsp");
    }
    else{
        currClass=session.getAttribute("sltClass").toString();
    }
    Connection con=DB.getConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=null;
%>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/newcss1.css"/>
        <title><%=currClass%></title>
        <SCRIPT type="text/javascript">
                window.history.forward();
                function noBack() { window.history.forward(); }
        </SCRIPT>
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
    <body style="background-color: #D1D0CE" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        
        <h2 style="font-size: 20px">Class Selected: <%=currClass%> 
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2>
         
         <form  action="ClassSummary.jsp" method="post">
            
            <p style="font-size: 20px">Percentage:<select name="percentage">
            <option value="0">All</option>
            <option value="90">&gt;90</option>
            <option value="75">&gt;=75</option>
            <option value="70">&lt;75 and &gt;=65</option>
            <option value="65">below 65</option>
                </select><p/>
            <input class="b3" type="submit" value="submit"/>
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           <a href="HOD_Classes.jsp" class='b3'>Back</a>
        <hr/>
        </form> 
         <table  class='table2' border='1' cellspacing='0'>
            <tr >
                <th>Roll NO</th>
                <th>Name</th>
                <%
                    float percentage=Float.valueOf((request.getParameter("percentage")==null)?"0":request.getParameter("percentage"));
                    
                    List<String> subjects=new ArrayList<String>();
                    List<Integer> staffIDs=new ArrayList<Integer>();
                    rs=stmt.executeQuery("select * from bec_dealingclass join bec_class on bec_dealingclass.class_name_id=bec_class.id where bec_class.section='"+currClass.charAt(1)+"' and bec_class.year="+currClass.charAt(0));
                    while(rs.next()){
                        staffIDs.add(rs.getInt(3));
                        subjects.add(rs.getString(4));
                   }
                   rs=null;
                   int[][] total=new int[2][subjects.size()];
                   List<String> Dates=new ArrayList<String>();
                   ResultSet rsDate=null;
                   rsDate=stmt.executeQuery("select DISTINCT Date from "+currClass.charAt(0)+"cse"+currClass.charAt(1));
                   while(rsDate.next()){
                       Dates.add(rsDate.getString(1));
                   }
                   
                   for (String currDate : Dates) {
                       rs=stmt.executeQuery("SELECT * FROM "+currClass.charAt(0)+"cse"+currClass.charAt(1)+" where Date='"+currDate+"' order by Batch");
                       int Batchidx=0;
                       //int subidx=0;
                        //int[] todayclasses=new int[10];
                        int lab_count=0;//if there is a lab then count is 2 otherwise count=1
                        while(rs.next()){
                            lab_count++;
                        }
                        int lc=0;
                        int[][] todayclasses=new int[lab_count][10];
                        rs.beforeFirst();
                        while (rs.next()) {
                            for(int i=1;i<10;i++){
                                todayclasses[lc][i]=rs.getInt(i+2);
                            }
                            lc++;
                        }
                        List<Integer> labdetails=new ArrayList<Integer>();//period details
                        if(lab_count==2){
                            labdetails=BAP.getLabPeriods(todayclasses);
                            for (int j = 1; j < 10; j++) {
                                if(labdetails.contains(j)){
                                    int index=staffIDs.lastIndexOf(todayclasses[0][j]);
                                    if(index!=-1)
                                        total[0][index]+=1;
                                    index=staffIDs.lastIndexOf(todayclasses[1][j]);
                                    if(index!=-1)
                                        total[1][index]+=1;
                                }
                            }
                        }
                        for (int j = 0; j < 10; j++) {
                            if(!labdetails.contains(j)){
                                int index=staffIDs.indexOf(todayclasses[0][j]);
                                if(index!=-1)
                                    total[0][index]+=1;
                            }
                        }
                       
                   }
                   int index=0;
                   int Mytotal=0;
                   for (String subject:subjects) {
                        out.print("<th>"+subject+"<br/>"+total[0][index]);
                        if(subject.contains("LAB")){
                            out.print("/"+total[1][index]);
                        }
                        out.print("</th>");
                        Mytotal+=total[0][index];
                        index++;
                   }
                %>
                <th>Total<br/><%=Mytotal%></th>
                <th>Percentage<br/>(<%
                    if(percentage==70){
                        out.print("Between 75 and 65");
                    }
                    else if(percentage==65){
                        out.print("Below 65");
                    }
                    else if(percentage==0){
                        out.print("All");
                    }
                    else{
                        out.print("Above "+percentage);
                    }
                %> )</th>
            </tr>
                <%
                   List<String> Names=new ArrayList<String>();
                   List<Integer> RollNos=new ArrayList<Integer>();
                   List<String> RegNos=new ArrayList<String>();
                   //List<String> Phonenos=new ArrayList<String>();
                   rs=stmt.executeQuery("SELECT * FROM bec.bec_student join bec.bec_class on bec_student.classDetails_id=bec_class.id where bec_class.section='"+currClass.charAt(1)+"' and bec_class.year="+currClass.charAt(0));
                   while(rs.next()){
                       Names.add(rs.getString(2));
                       RegNos.add(rs.getString(3));
                       RollNos.add(rs.getInt(4));
                   } 
                   int[][] presentTotal=new int[RegNos.size()][subjects.size()];
                   int regIdx=0,subindx=0;
                   for(String regNum:RegNos){
                       rs=stmt.executeQuery("select * from "+regNum);
                       while(rs.next()){
                           subindx=0;
                           //out.print("<tr><td>"+regNum+"</td>");
                           int subidx=3;
                           for (String sub : subjects) {
                               //out.print(rs.getInt(subidx));
                                   if(rs.getInt(subidx)!=-1)
                                    presentTotal[regIdx][subindx]+=rs.getInt(subidx);
                                   subidx++;
                                   subindx++;
                               }
                          //out.print("</tr>");
                       }
                       regIdx++;
                   }
                   for (int i = 0; i < regIdx; i++) {
                       int mytotal=0;
                       for (int j = 0; j < subindx; j++) {
                            mytotal+=presentTotal[i][j];
                       }
                       float my_per=(mytotal/(float)Mytotal)*100;
                       if(percentage==0||percentage==75||percentage==90){
                            if(my_per>=percentage){
                                out.print("<tr><td>"+RegNos.get(i)+"</td><td>"+Names.get(i)+"</td>");   
                                for (int j = 0; j < subindx; j++) out.print("<td>"+presentTotal[i][j]+"</td>");
                                out.print("<td>"+mytotal+"</td><td>"+my_per+"</td></tr>");
                            }
                        }
                        else if(percentage==70.0&&(my_per>=65&&my_per<75)){
                            out.print("<tr><td>"+RegNos.get(i)+"</td><td>"+Names.get(i)+"</td>");   
                            for (int j = 0; j < subindx; j++) out.print("<td>"+presentTotal[i][j]+"</td>");
                            out.print("<td>"+mytotal+"</td><td>"+my_per+"</td></tr>");
                        }
                        else if(percentage==65&&my_per<percentage){
                            out.print("<tr><td>"+RegNos.get(i)+"</td><td>"+Names.get(i)+"</td>");   
                            for (int j = 0; j < subindx; j++) out.print("<td>"+presentTotal[i][j]+"</td>");
                            out.print("<td>"+mytotal+"</td><td>"+my_per+"</td></tr>");
                            
                        }
                       
                       
                       
                       }
                  
                        
                        
                %>
            
        </table>

        
    </body>
</html>
