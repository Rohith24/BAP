<%-- 
    Document   : Login
    Created on : 5 Jan, 2017, 12:07:07 PM
    Author     : Pavankumar
    Staff 
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" class="database.DatabaseCon"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
    </head>
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
       <form method="POST" action="status.jsp">
           <% Date dt = new Date();
                SimpleDateFormat ft = 
                new SimpleDateFormat ("dd-MM-yyyy");
                out.print(ft.format(dt));
           %><br/><br/>
           Choose Period:
        <% 
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date today = Calendar.getInstance().getTime();
            String Class="4CSEA";
            Connection con=DB.getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs=null;
            try{
                rs= stmt.executeQuery("select * from "+Class+" where Date='"+df.format(today)+"'");
            }catch(Exception ex){
                stmt.executeUpdate(DB.CreateClassTable(Class));
                rs= stmt.executeQuery("select * from "+Class+" where Date='"+df.format(today)+"'");
            }
            int count=0;
            int[] periods=new int[10];
            while(rs.next()){
                count++;
                for (int i = 1; i < 10; i++) {
                        periods[i]=rs.getInt(i+2);
                        if(periods[i]!=1){
                            %>
                            <input type="checkbox" name="p<%=i%>" value = "<%=i%>"><%=i%></option>
                            <%
                        }
                    }
            }
            if(count==0){
                for (int i = 1; i < 10; i++) {
                        %>
                        <input type="checkbox" name="p<%=i%>" value = "<%=i%>"><%=i%></option>
                        <%
                    }
                stmt.executeUpdate("insert into "+Class+"(Date) values('"+df.format(today)+"')");
            }
        %>
           
   <br/><br/>
           
           ENTER ABSENT NUMBERS:<textarea id="nums" name="nums"></textarea><br/>
           <br/>
           <input type="submit" title="submit">
       </form>  
        
    </body>
</html>
