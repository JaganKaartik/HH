/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 

References 

JDBC Prepared Statement : https://www.studytonight.com/servlet/registration-form-example-in-servlet.php

*/

package HealthRecord;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.ServletException;
/**
 *
 * @author jagankaartik58
 */
public class SignupServlet extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
             PrintWriter out = rep.getWriter();
            try {
                String username = req.getParameter("user");
                String password = req.getParameter("password");
                String role = req.getParameter("role");
                String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
                String db_username = "postgres";
                try {
                    Class.forName("org.postgresql.Driver");
                }
                catch (ClassNotFoundException ex) 
                {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
                PreparedStatement ps = conn.prepareStatement("insert into public.\"User\" values(?,?,?)");
                ps.setString(1, username);
                ps.setString(2, role);
                ps.setString(3, password);
                int val = ps.executeUpdate();
                if(val>0)
                {
                    out.println("Success!");
                    //Success
                }
                else
                {
                    out.println("Failed!");
                    //fail
                }
            }
            catch (SQLException ex) 
                {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
    }
}
