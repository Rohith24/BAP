package dateop;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pavankumar
 */
public class DateSelection {
    public String prevWorkingDay(String toDate){
        String prevDate=toDate;
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        
        try {
            do{
            prevDate=previousDateString(prevDate);
            }while(IsHoliday(prevDate));
            /*Date myDate = dateFormat.parse(prevDate);
            if(dayFormat.format(myDate).equalsIgnoreCase("sun")){
                prevDate=previousDateString(prevDate);
            }*/
            
        } catch (ParseException ex) {
            Logger.getLogger(DateSelection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prevDate;
    }
    public boolean IsHoliday(String myDate){
        try {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            DateFormat dayFormat = new SimpleDateFormat("E");
            if(dayFormat.format(dateFormat.parse(myDate)).equalsIgnoreCase("sun")){
                return true;
            }
            Connection con=new database.DatabaseCon().getConnection();
            Statement st=con.createStatement();
            ResultSet rsDt=st.executeQuery("select * from bec_holidays where Date='"+getSQLDate(myDate)+"'");
            while(rsDt.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DateSelection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(DateSelection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static String previousDateString(String dateString) 
            throws ParseException {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date myDate = dateFormat.parse(dateString);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(myDate);
        calendar.add(Calendar.DAY_OF_YEAR, -1);
        Date previousDate = calendar.getTime();
        String result = dateFormat.format(previousDate);
        Date dt=new Date();
        calendar.setTime(dt);
        return result;
    }
    public String getSQLDate(String D){
        DateFormat df = new SimpleDateFormat("dd/mm/yyyy");
        DateFormat sqlDF = new SimpleDateFormat("yyyy-mm-dd");
        try{
            return sqlDF.format(df.parse(D));
        }
        catch(Exception ex){
            
        }
        return D;
    }
    public String getSQLDateFromCal(String D){
        DateFormat df = new SimpleDateFormat("mm/dd/yyyy");
        DateFormat sqlDF = new SimpleDateFormat("yyyy-mm-dd");
        try{
            return sqlDF.format(df.parse(D));
        }
        catch(Exception ex){
            
        }
        return D;
    }
}
