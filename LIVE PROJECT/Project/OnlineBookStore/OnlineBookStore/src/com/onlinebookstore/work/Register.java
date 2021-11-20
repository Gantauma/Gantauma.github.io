/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinebookstore.work;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author LENOVO
 */
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
        String cus_id=request.getParameter("cus_id");
        String cus_pwd=request.getParameter("cus_pwd");
        String re_cus_pwd=request.getParameter("re_cus_pwd");
        String cus_email=request.getParameter("email");
        String cus_number=request.getParameter("cus_number");
        String cus_addrs=request.getParameter("cus_addrs");
        if(cus_pwd.equals(re_cus_pwd))
        {
           try
        {
            Statement st=com.onlinebookstore.db.DB.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from customer_register where cus_id='"+cus_id+"'");
            if(rs.next())
            {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Customer Already Registered')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");    
            }
            else
            {
             PreparedStatement pst=com.onlinebookstore.db.DB.getConnect().prepareStatement("insert into customer_register(cus_id,cus_pwd,cus_email,cus_number,cus_addrs,status) values(?,?,?,?,?,?)");
            pst.setString(1,cus_id);
            pst.setString(2,cus_pwd);
            pst.setString(3,cus_email);
            pst.setString(4,cus_number);
            pst.setString(5,cus_addrs);
            pst.setString(6,"Student Locked");
            pst.executeUpdate();
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Successfully Registered')"); 
        out.println("window.location= 'index.jsp'");
        out.println("</script>");   
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        } 
        }
        else
        {
        out.println("<script type='text/javascript'>"); 
        out.println("alert('Password Not Matched')"); 
        out.println("window.location= 'index.jsp'");
        out.println("</script>");
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
