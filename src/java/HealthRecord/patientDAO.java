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

/* 
        Patient Information Data Access Object 
        Establish JDBC Connectivity
*/

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
import javax.servlet.ServletException;


/* Servlet Collaboration (2nd Servlet) */


public class patientDAO extends HttpServlet
{
    /* JDBC Steps */

    /**
     *
     * @param req
     * @param rep
     * @throws SQLException
     */


    @Override
    public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
    {

	    String PatientID;
	    String First_name;
	    String Last_name;
	    String DOB;
	    String BloodGroup;
	    String Address;
	    String Pincode;
	    String PhoneNumber;
	    String MaritalStatus;
	    String Age;
	    String Sex;


	    try {

	    		/* Testing PrintWriter */

	    		PrintWriter out = rep.getWriter();

                try {
                    Class.forName("org.postgresql.Driver");
                }
                catch(ClassNotFoundException ex) {
                    System.out.println(ex);
                }
                
                /* Fetching Item from previous servlet */
                
                String id = (String) req.getAttribute("id");
                
                String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
                String db_username = "postgres";
                String sql = "select * from public.\"PatientInformation\" where pid = '"+id+"' ";

                Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
                
                Statement st = conn.createStatement();

                ResultSet rs = st.executeQuery(sql);
                
                //Using POJO (Plain Old Java Object) to Store Information
             
                Patient patient_obj = new Patient();
                
                while(rs.next())
                {
                    PatientID = rs.getString(1);
                    First_name = rs.getString(2);
                    Last_name = rs.getString(3);
                    DOB = rs.getString(4);
                    BloodGroup = rs.getString(5);
                    Address = rs.getString(6);
                    Pincode = rs.getString(7);
                    PhoneNumber = rs.getString(8);
                    MaritalStatus = rs.getString(9);
                    Age = rs.getString(10);
                    Sex = rs.getString(11);

                    patient_obj.setValue(PatientID,First_name,Last_name,DOB,BloodGroup,Address,Pincode,PhoneNumber,MaritalStatus,Age,Sex);
                    	
                    out.println(patient_obj.getFirst_name());
                    out.println(patient_obj.getAddress());

               	 	//Pass the Data Back

               	 	req.setAttribute("pDAO",patient_obj);
                	req.getRequestDispatcher("Demo.jsp").forward(req,rep);
                }   
               	
            }
	    catch(SQLException ex) {
	        Logger.getLogger(patientDAO.class.getName()).log(Level.SEVERE, null,ex);
	    }
	}


}
