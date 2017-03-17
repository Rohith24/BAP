
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateCheck 
{
    
    public static void main(String[] args) throws Exception { 
	  DateFormat dayFormat = new SimpleDateFormat("E");
          DateFormat df1 = new SimpleDateFormat("dd/mm/yyyy");
          String myDate="17/01/2017";
          SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
	       System.out.println(df1.parse(myDate).toString());
	  Connection con=new database.DatabaseCon().getConnection();
	  Statement st=con.createStatement();
          st.executeUpdate("insert into bec_holidays(Date,Reason) values('"+df.format(df1.parse(myDate))+"','Holiday')");
	  ResultSet rsDt=st.executeQuery("select * from bec_holidays");
	  while(rsDt.next()){
                System.out.println(rsDt.getString(2)+"_"+rsDt.getString(3));
	  }
    }
}