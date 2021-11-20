package com.onlinebookstore.work;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession();
        String cus_id=request.getParameter("cus_id");
        String cus_pwd=request.getParameter("cus_pwd");
        String a="admin";
        
        
            try
        {
            String customer_id=null,status=null;
            Statement st=com.onlinebookstore.db.DB.getConnect().createStatement();
            ResultSet rs=st.executeQuery("select * from customer_register where cus_id='"+cus_id+"' and cus_pwd='"+cus_pwd+"'");
            if(rs.next())
            {
                customer_id=rs.getString(1);
                status=rs.getString(6);
                session.setAttribute("customer_id",customer_id);
                if(status.equals("Student Unlocked"))
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Successfully Logged In')"); 
                out.println("window.location= 'HomePage.jsp'");
                out.println("</script>");
                }
                else
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('You are not activated still. Wait some time')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");   
                }
                rs.close();
                st.close();
            }
            else
            {
                Statement stmt=com.onlinebookstore.db.DB.getConnect().createStatement();
                ResultSet rst=stmt.executeQuery("select * from admin where u_name='"+cus_id+"' and pwd='"+cus_pwd+"'");
                if(rst.next())
                {
                    session.setAttribute("admin_id",rst.getString(3));
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Admin Logged in Successfully')"); 
                out.println("window.location= 'AdminHome.jsp'");
                out.println("</script>");
                }
                else
                {
                out.println("<script type='text/javascript'>"); 
                out.println("alert('Please Check Your Customer ID and Password')"); 
                out.println("window.location= 'index.jsp'");
                out.println("</script>");
                }
            }
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
