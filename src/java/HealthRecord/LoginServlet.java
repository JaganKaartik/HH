/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package HealthRecord;

import java.sql.*;
import java.io.IOException;
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
                    System.out.println(ex);
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

                        HttpSession session = req.getSession();
                        session.setAttribute("uname",uname);
                        session.setAttribute("role",role);

                        
                        switch (role)
                        {
                            case "Admin":

                                /* Redirect to Admin Page */
                                //out.println("Admin Login Verified");

                                //rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Admin.jsp");

                                req.getRequestDispatcher("Admin.jsp").forward(req,rep);
                                break;
                            case "Receptionist":

                                /* Redirect to Receptionist Page */
                                //out.println("Receptionist Login Verified");
                                //rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Reception.jsp");
                                
                                req.getRequestDispatcher("Reception.jsp").forward(req,rep);
                                break;
                            case "Doctor":

                                /* Redirect to Doctor Page */
                                //out.println("Doctor Login Verified");
                                //rep.sendRedirect("http://localhost:8080/ElectronicHealthRecord/Doctor.jsp");
                                
                                req.getRequestDispatcher("Doctor.jsp").forward(req,rep);
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
                    
                   req.getRequestDispatcher("index.html").forward(req,rep);  

                }
                st.close();
                conn.close();
            }
            catch (SQLException ex) 
                {
                    System.out.println(ex);
                }
    }
}
