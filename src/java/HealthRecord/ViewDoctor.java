/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;

/**
 *
 * @author jagankaartik58
 */

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.ServletException;


public class ViewDoctor extends HttpServlet 
{
    String EID = null;
    String Name;
    String Gender;
    String Education;
    String Speciality;
    String Certifications;    

    public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
            /* Testing PrintWriter */

	    PrintWriter out = rep.getWriter();
            
            
        try {
             try {
                 Class.forName("org.postgresql.Driver");
             }
             catch(ClassNotFoundException ex) {
                 System.out.println(ex);
             }
             
             /* Fetching Id from Reception.JSP */
             
             String id = req.getParameter("id");
             
             String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
             String db_username = "postgres";
             String sql = "select * from public.\"Doctor\" where id = '"+id+"' ";
             
             Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
             
             Statement st = conn.createStatement();
             
             ResultSet rs = st.executeQuery(sql);

             //Using POJO (Plain Old Java Object) to Store Information

             if (rs.next() == false) 
             {
                  
                  rep.sendRedirect("error_page.jsp");
             
             }
             
             Doctor doctor_obj = new Doctor();
             
                 while(rs.next())
                 {
                     EID = rs.getString(1);
                     doctor_obj.setEID(EID);
                     
                     Name = rs.getString(2);
                     doctor_obj.setName(Name);
                     
                     Gender = rs.getString(3);
                     doctor_obj.setGender(Gender);
                     
                     Education = rs.getString(4);
                     doctor_obj.setEducation(Education);
                     
                     Speciality = rs.getString(5);
                     doctor_obj.setSpeciality(Speciality);
                     
                     Certifications = rs.getString(6);
                     doctor_obj.setCerfitications(Certifications);

                     req.setAttribute("doctor",doctor_obj);
                     req.getRequestDispatcher("Reception.jsp").forward(req,rep);
                 }
             
            }
                catch(SQLException ex) 
                {
                    System.out.println(ex);
                }
    }   
}
