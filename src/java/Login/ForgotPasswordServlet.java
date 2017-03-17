/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import database.DatabaseCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import org.apache.commons.lang3.RandomStringUtils;
/**
 *
 * @author Pavankumar
 */
public class ForgotPasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 30) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            Connection con=new DatabaseCon().getConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from bec_staff_login where username='"+request.getParameter("Email")+"'");
            int count=0;
            while(rs.next()){
                count++;
            }
            if(count==0){
                session.setAttribute("InvalidEmail", request.getParameter("Email")+" not found.");
                out.print("Email ID not found.");
                response.sendRedirect("forgotPassword.jsp");
            }
            else{
                String characters = "";
                String pwd = getSaltString();
                String Email=request.getParameter("Email");
                st.executeUpdate("insert into forgotpassword(EmailID,`Key`) values('"+Email +"','"+pwd+"')");
                request.setAttribute("to", request.getParameter("Email") );
                request.setAttribute("subject", "Forgot Password");
                request.setAttribute("message", "Please Click the following link to activate your Account "+request.getRequestURL()+"?key="+pwd+"'>LINK</a>");
                RequestDispatcher rd=getServletContext().getRequestDispatcher("/sendMail.jsp");
                rd.forward(request,response);
                //out.print();
            }
        } catch (SQLException ex) {
            out.print(ex.getMessage());
        }
        catch (Exception ex) {
            out.print(ex.getMessage());
        }
        
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            Connection con=new DatabaseCon().getConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from forgotpassword where `Key`='"+request.getParameter("key")+"'");
            int count=0;
            String Email="";
            while(rs.next()){
                Email=rs.getString(2);
            }
            //session.setAttribute("Email", Email);
            //session.setAttribute("key", request.getParameter("key"));
            out.println("<form action='UpdatePassword.jsp' method='post'>");
            out.println("Email ID:<input type='text' name='Email' value='"+Email+"'/>");
            out.println("<input type='hidden' name='key' value='"+request.getParameter("key")+"'/>");
            out.println("Password:<input type='password' name='pass' required/>");
            out.println("<input type='Submit' value='Update'/></form>");
            
        } catch (SQLException ex) {
            out.print(ex.getMessage());
        }
        catch (Exception ex) {
            out.print(ex.getMessage());
        }
        
        
    }
    

}
