package com.onlinebookstore.work;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
public class Unlock extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String lock=request.getQueryString();
        String admin_id=(String)session.getAttribute("admin_id");
        System.out.println("admin_id:"+admin_id);
        lock=lock.replace("%20", " ");
        try
        {
          PreparedStatement pst=com.onlinebookstore.db.DB.getConnect().prepareStatement("update customer_register set status='Student Unlocked',admin_id='"+admin_id+"' where cus_id='"+lock+"'"); 
          pst.executeUpdate();
            out.println("<script type='text/javascript'>"); 
            out.println("alert('Successfully Unlocked the Student')"); 
            out.println("window.location= 'AdminHome.jsp'");
            out.println("</script>");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
