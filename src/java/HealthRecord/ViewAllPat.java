/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HealthRecord;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
    
     public void doGet(HttpServletRequest req,HttpServletResponse rep) throws ServletException, IOException
     {
            /* Initialize Objects of type Patient */
            
            Patient[] patient_obj = new Patient[10];
            
            for(int i=0;i<10;++i)
            {
                patient_obj[i] = new Patient();
            }

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
                String sql = "select * from public.\"PatientInformation\"";
                
                Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
                
                Statement st = conn.createStatement();
                
                ResultSet rs = st.executeQuery(sql);

                int i=0;

                while(rs.next())
                {
                    PatientID = rs.getString(1);
                    patient_obj[i].setPatientID(PatientID);
                    
                    First_name = rs.getString(2);
                    patient_obj[i].setFirst_name(First_name);
                    
                    Last_name = rs.getString(3);
                    patient_obj[i].setLast_name(Last_name);
                    
                    DOB = rs.getString(4);
                    patient_obj[i].setDOB(DOB);
                    
                    BloodGroup = rs.getString(5);
                    patient_obj[i].setBloodGroup (BloodGroup);
                    
                    Address = rs.getString(6);
                    patient_obj[i].setAddress(Address);
                    
                    Pincode = rs.getString(7);
                    patient_obj[i].setPincode(Pincode);
                    
                    PhoneNumber = rs.getString(8);
                    patient_obj[i].setPhoneNumber(PhoneNumber);
                    
                    MaritalStatus = rs.getString(9);
                    patient_obj[i].setMaritalStatus(MaritalStatus);
                    
                    Age = rs.getString(10);
                    patient_obj[i].setAge(Age);
                    
                    Sex = rs.getString(11);
                    patient_obj[i].setSex(Sex);

                    //Pass the Data Back

                    req.setAttribute("pobj",patient_obj);
                    req.getRequestDispatcher("Admin.jsp").forward(req,rep);
                    i+=1;
                } 
            }
            catch(SQLException ex) {
                System.out.println(ex);
            }
     }
}
