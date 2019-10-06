/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jagankaartik58
 */
public class ViewAllPat extends HttpServlet 
{
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
            
            String[] unames = new String[3]; //0 1 2
            String[] roles = new String[3]; //0 1 2
            int i = 0;
            
            while(rs.next())
            {
                unames[i] = rs.getString(1);
                roles[i] = rs.getString(2);
                i+=1;
            }
            
            req.setAttribute("unames",unames);
            req.setAttribute("roles",roles);
            req.getRequestDispatcher("Admin.jsp").forward(req, rep);
            
            /* Testing Strings */
            
        }
        catch(SQLException ex) {
            Logger.getLogger(ViewAllPat.class.getName()).log(Level.SEVERE, null,ex);
        }

    }   
}
