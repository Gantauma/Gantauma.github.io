package com.onlinebookstore.db;
import java.sql.*;

public class DB {
    public static Connection con;
    
    public static Connection getConnect()
    {
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebookstore","root","");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}