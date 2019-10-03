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

import java.sql.*;
import javax.servlet.http.*;
import java.io.*:
import javax.servlet.ServletException;


/* Servlet Collaboration (2nd Servlet) */


public class patientDAO extends HttpServlet
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

    /* JDBC Steps */

    public void doGet(HttpServletRequest req,HttpServletResponce rep)
    {

	    try {
	        Class.forName("org.postgresql.Driver");
	    }
	    catch(ClassNotFoundException ex) {
	        System.out.println(ex);
	    }
	    
	    /* Fetching Item from previous servlet */

	    String id = req.getParameter("id");

		String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
		String db_username = "postgres";
		String sql = "select * from public.\"PatientInformation\" where pid = ' "+id+" ' ";

		Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");

		Statement st = conn.createStatement();
	    ResultSet rs = st.executeQuery(sql);

	    Patient obj = new Patient();

	    while(rs.next())
	    {
	    	String PatientID = rs.getString(1);
		    String First_name = rs.getString(2);
		    String Last_name = rs.getString(3);
		    String DOB = rs.getString(4);
		    String BloodGroup = rs.getString(5);
		    String Address = rs.getString(6);
		    String Pincode = rs.getString(7);
		    String PhoneNumber = rs.getString(8);
		    String MaritalStatus = rs.getString(9);
		    String Age = rs.getString(10);
		    String Sex == rs.getString(11);
	    }

	}


}
