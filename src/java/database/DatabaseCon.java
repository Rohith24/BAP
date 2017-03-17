/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pavankumar
 */
public class DatabaseCon {
    public Connection getConnection()
        {
            String url= "localhost/bec";
            String id= "root";
            String pass = "admin";
            // Remember to change the next line with your own environment 
            /* String url= "ap-cdbr-azure-southeast-b.cloudapp.net/bap";
            String id= "bf099cfd7e031b";
            String pass = "a085a02d"; */
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://"+url+"?useAffectedRows=true",id,pass);
                return con;           
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ex.getMessage());
            }
            return null;
        }
    public String getCreateStmt(String Name,int ClassId){
        String sql="CREATE TABLE `"+Name+"`(id int(11) NOT NULL AUTO_INCREMENT,"+
              "Date date DEFAULT NULL,";
        List<String> subjects=new ArrayList<String>();
        Connection con=getConnection();
        Statement st=null;
        ResultSet rs=null;
        try {
            st=con.createStatement();
            rs=st.executeQuery("select * from bec_dealingclass where class_name_id="+ClassId);
            while(rs.next()){
                subjects.add(rs.getString(4));
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(DatabaseCon.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (Iterator<String> iterator = subjects.iterator(); iterator.hasNext();) {
            String next = iterator.next();
            sql+="`"+next+"` int(11) DEFAULT '0',";
        }
        sql+="PRIMARY KEY (id),"+
              "UNIQUE KEY id_UNIQUE (id)"+
            ") AUTO_INCREMENT=2 DEFAULT CHARSET=utf8";
        System.out.println(sql);
        return sql;
    }
    public String CreateClassTable(String ClassName){
        return "CREATE TABLE "+ClassName+"(id int(11) NOT NULL AUTO_INCREMENT,"+
              "Date date DEFAULT NULL,"+
              "p1 int(11) DEFAULT '0',"+
              "p2 int(11) DEFAULT '0',"+
              "p3 int(11) DEFAULT '0',"+
              "p4 int(11) DEFAULT '0',"+
              "p5 int(11) DEFAULT '0',"+
              "p6 int(11) DEFAULT '0',"+
              "p7 int(11) DEFAULT '0',"+
              "p8 int(11) DEFAULT '0',"+
              "p9 int(11) DEFAULT '0',"+
              "Batch int(11) DEFAULT '0',"+
              "PRIMARY KEY (id),"+
              "UNIQUE KEY id_UNIQUE (id)"+
            ") AUTO_INCREMENT=2 DEFAULT CHARSET=utf8";
    }
}
