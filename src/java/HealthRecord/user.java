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
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jagankaartik58
 */

class User
{
    String username;
    String password;
}

class Admin extends User
{
    String adminId;
    String adminName;
}

class Doctor extends User
{
    String doctorid;
    String doctorName;
    String dept;
}

class Receptionist extends User
{
    String empId;
    String empName;
}