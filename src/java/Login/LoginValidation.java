/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import database.DatabaseCon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import md5encryption.Md5Encryption;
/**
 *
 * @author Pavankumar
 */
public class LoginValidation {
    public int LoginValidate(String username,String password,String login_as){
        int ID=-1;
        try {
            int pass=Md5Encryption.encrypt(password);
            try {
                DatabaseCon db=new DatabaseCon();
                Connection con=db.getConnection();
                Statement st=con.createStatement();
                ResultSet rs=null;
                rs=st.executeQuery("select "+login_as+"_id from bec_"+login_as+"_login where username='"+username+"' and password='"+pass+"'");
                //ResultSet rs=st.executeQuery("select * from bec_"+login_as+" where Name='"+username+"'");
                while(rs.next()){
                    ID=rs.getInt(1);
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(LoginValidation.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } catch (Exception ex) {
            Logger.getLogger(LoginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }    
   public int getHash(String text){
        try {
            return Md5Encryption.encrypt(text);
        } catch (Exception ex) {
            Logger.getLogger(LoginValidation.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
   }
}
