/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package HealthRecord;

import java.sql.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.ServletException;

/* Login-Servlet is working */

/**
 *
 * @author jagankaartik58
 */

public class LoginServlet extends HttpServlet
{
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
            try {
                String checkname = req.getParameter("user");
                String checkpass = req.getParameter("password");
                String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
                String db_username = "postgres";
                String sql = "select * from public.\"User\" ";
                try {
                    Class.forName("org.postgresql.Driver");
                }
                catch (ClassNotFoundException ex) 
                {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                int flag = 1;
                while (rs.next())
                {
                    String uname = rs.getString("username");
                    String psswrd = rs.getString("password"); 
                    if(uname.equals(checkname) && psswrd.equals(checkpass))
                    {
                        String role = rs.getString("role");
                        switch (role)
                        {
                            case "Admin":
                                /* Redirect to Admin Page */
                                //out.println("Admin Login Verified");
                                rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Admin.jsp");
                                break;
                            case "Receptionist":
                                /* Redirect to Receptionist Page */
                                //out.println("Receptionist Login Verified");
                                rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Reception.jsp");
                                break;
                            case "Doctor":
                                /* Redirect to Doctor Page */
                                //out.println("Doctor Login Verified");
                                rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Doctor.jsp");
                                break;
                            default:
                                break;
                        }
                        flag = 0;
                        break;
                    }
                }
                if(flag==1)
                {
                    //out.println("User! Not Found");
                }
            }
            catch (SQLException ex) 
                {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
    }
}
