/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jagankaartik58
 */


/*

    View All Users Servlet

*/


public class ViewAllUser extends HttpServlet 
{
    String uname[] = new String[10];
    String roles[] = new String[10];
    String temp;
    

    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
        try {
            //JDBC Steps
            
            PrintWriter out = rep.getWriter();
            
            try {
                Class.forName("org.postgresql.Driver");
            }
            catch(ClassNotFoundException ex) {
                System.out.println(ex);
            }
            
            String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
            String db_username = "postgres";
            String sql = "select * from public.\"User\"";
            
            Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
            
            Statement st = conn.createStatement();
            
            ResultSet rs = st.executeQuery(sql);

            int i = 0;
            
            while(rs.next())
            {
                temp = rs.getString("name");
                uname[i] = temp;
                temp = rs.getString("role");
                roles[i] = temp;
                i+=1;
            }
            req.setAttribute("uname",uname);
            req.setAttribute("roles",roles);
            req.getRequestDispatcher("Admin.jsp").forward(req,rep);
            
        }
        catch(SQLException ex) {
            System.out.println(ex);
        }

    }   
}
