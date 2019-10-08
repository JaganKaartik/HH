<%-- 
    Document   : Doctor
    Created on : Sep 30, 2019, 4:52:16 PM
    Author     : jagankaartik58
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- BootStrap Framework -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js" ></script>

                            <!-- Materialize Front End Framework -->

        <!-- Compiled and minified CSS -->
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> 

        <!-- Compiled and minified JavaScript -->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> 

        <!-- JQuery -->
        
        <script src=' https://code.jquery.com/jquery-3.4.1.min.js'></script>

        <!-- Custom CSS -->
        
        <link rel="stylesheet" href="css/base.css" type="text/css">

         <!-- External JavaScript File -->
        
        <script src="js/home.js"></script>

        <title>Doctor JSP</title>

    </head>
    <body>

       <!-- CHECK IF USER IS LOGGIN IN OR NOt USING SESSION TRACKING -->

        <%

            if(session.getAttribute("uname")==null)
            {
                response.sendRedirect("index.html");
            }

        %>

        <nav>
            <div class="nav-wrapper light-blue darken-3">
                <!-- HREF TO ABOUT.HTML -->
                <a href="#" class="brand-logo right">HygeaHealth+</a>
                <a href="#" class="brand-logo center">Doctor Dashboard</a>
                <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li>
                <form action="logout" method="post">
                    <button type="submit" class="btn btn-primary">LogOut</button>
                </form>
                </li>
                </ul>
            </div>
        </nav>

        <!-- 

                Doctor Schema

                String EID;
                String Name;
                String Gender;
                String Education;
                String Speciality;
                String Certifications;

                Patient Schema

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
                

                Doctor <TREATS> Patients

                Doctor X  -> Treats Patient(s) Y..

                Medical Records

                                <TREATS>

                EID Name Speciality PatientID (Medical History)









         -->

    </body>
</html>
