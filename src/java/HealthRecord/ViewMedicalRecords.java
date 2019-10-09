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
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.ServletException;

public class ViewMedicalRecords extends HttpServlet
{
    private String PatientID; 
    private String Allergies; 
    private String Medications; 
    private String Problems; 
    private String Vaccinations;
    private String Height; 
    private String Weight;  
    private String BodyTemp; 
    private String PulseRate;
    private String BPDiastolic;
    private String BPSystolic;
    private String PrevConsultation;
    private String Habits;
    private String SurgeryHistory;

	public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
	{
		
		/* PrintWriter for Testing and DeBugging */

		PrintWriter out = rep.getWriter();
          

         try {
             Class.forName("org.postgresql.Driver");
         }
         catch(ClassNotFoundException ex) {
             System.out.println(ex);
         }
         
         /* Fetching Id from Recpetion.JSP */
         
         String id = req.getParameter("recordid");
         
         String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
         String db_username = "postgres";
         String sql = "select * from public.\"MedicalRecords\" where patientid = '"+id+"' ";
         
         Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
	}
}
