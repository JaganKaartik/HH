/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package HealthRecord;

/* POJO for Patient Information */

/**
 *
 * @author jagankaartik58
 */

public class patient 
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
    
    void setValue(String pid,String fname,String lname,String dob,String bg,String ad,String pin,String pn,String ms,String age,String sex)
    {
        this.PatientID = pid;
        this.First_name= fname;
        this.Last_name= lname;
        this.DOB = dob;
        this.BloodGroup = bg;
        this.Address = ad;
        this.Pincode = pin;
        this.PhoneNumber = pn;
        this.MaritalStatus = ms;
        this.Age = age;
        this.Sex = sex;
    }
    
}
