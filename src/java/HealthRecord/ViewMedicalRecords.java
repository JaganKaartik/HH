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
		
         try {

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
             
             Statement st = conn.createStatement();
             
             ResultSet rs = st.executeQuery(sql);
             
             //Using POJO (Plain Old Java Object) to Store Information
             
             MedicalRecord mr = new MedicalRecord();
             
             while(rs.next())
             {
                 
                 PatientID = rs.getString(1);
                 mr.setPatientID(PatientID);
                 
                 Allergies = rs.getString(2);
                 mr.setAllergies(Allergies);
                 
                 Medications = rs.getString(3);
                 mr.setMedications(Medications);
                 
                 Problems = rs.getString(4);
                 mr.setProblems(Problems);
                 
                 Vaccinations = rs.getString(5);
                 mr.setVaccinations(Vaccinations);
                 
                 Height = rs.getString(6);
                 mr.setHeight(Height);
                 
                 Weight = rs.getString(7);
                 mr.setWeight(Weight);
                 
                 BodyTemp = rs.getString(8);
                 mr.setBodyTemp(BodyTemp);
                 
                 PulseRate = rs.getString(9);
                 mr.setPulseRate(PulseRate);
                 
                 BPDiastolic = rs.getString(10);
                 mr.setBPDiastolic(BPDiastolic);
                 
                 BPSystolic = rs.getString(11);
                 mr.setBPSystolic(BPSystolic);
                 
                 PrevConsultation = rs.getString(12);
                 mr.setPrevConsultation(PrevConsultation);
                 
                 Habits = rs.getString(13);
                 mr.setHabits(Habits);
                 
                 SurgeryHistory = rs.getString(14);
                 mr.setSurgeryHistory(SurgeryHistory);
                 
                 //Pass the Data Back to Reception.JSP
                 
                 req.setAttribute("medicalrecord",mr);
                 req.getRequestDispatcher("Reception.jsp").forward(req,rep);
                 
             }
             
             if (rs.next() == false)
             {
                 req.getRequestDispatcher("error_page.jsp").forward(req,rep);
             }
             
         }
         catch(SQLException ex) {
             Logger.getLogger(ViewMedicalRecords.class.getName()).log(Level.SEVERE, null,ex);       
         }

	}
}
