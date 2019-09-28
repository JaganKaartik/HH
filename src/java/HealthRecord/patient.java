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
public class patient 
{ 
    String patientName;
    String patientID;
    String DOB;
    String BloodGroup;
    String Address;
    String PhoneNumber;
    String MaritalStatus;
    
    void setValue(String pname,String pid,String dob,String bg,String ad,String pn,String ms)
    {
        this.patientName = pname;
        this.patientID = pid;
        this.Address = ad;
        this.BloodGroup = bg;
        this.MaritalStatus = ms;
        this.PhoneNumber = pn;
        this.DOB = dob;
    }
    
}
