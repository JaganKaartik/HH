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


public class DeletePat extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {
    	PrintWriter out = rep.getWriter();  
        try{
              try{
                  Class.forName("org.postgresql.Driver");
              }
              catch(ClassNotFoundException ex) {
                  System.out.println(ex);
              }
              
              /* Fetching Id from Reception.JSP */
              
              String id = req.getParameter("id");
              
              String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
              String db_username = "postgres";
              String sql = "delete from public.\"PatientInformation\" where pid = '"+id+"' ";
              
              Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
              
              Statement st = conn.createStatement();

              
              int val = st.executeUpdate(sql);
              
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
              
              /* Close Statement and Connection in JDBC */

              st.close();
              conn.close();

              /* Forward! Re-Direct to Reception.JSP */

              rep.sendRedirect("Reception.jsp");
     
              
          }
             catch(SQLException ex) {
                 Logger.getLogger(DeletePat.class.getName()).log(Level.SEVERE, null,ex);
             }

    }    
}
