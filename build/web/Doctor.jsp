<%-- 
    Document   : Doctor
    Created on : Sep 30, 2019, 4:52:16 PM
    Author     : jagankaartik58
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="HealthRecord.MedicalRecord"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="HealthRecord.Patient"%>
<%@page import="HealthRecord.Doctor"%>

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

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

         <!-- External JavaScript File -->
        
        <script src="js/home.js"></script>

        <!-- Google Fonts -->

        <link href='https://fonts.googleapis.com/css?family=Actor' rel='stylesheet'>

        <style type="text/css">
            
            .jagmod{
                font-family: 'Actor';font-size: 22px;
            }
        </style>

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
            <div class="nav-wrapper cyan darken-4 ">
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

         <div class="container">
            <%
                
                String username = (String)session.getAttribute("uname");  
                String role = (String)session.getAttribute("role");  

            %>
                 <h4 class="center-align white-text">Welcome! Dr. <%=username%></h4> 
            
        </div>

         <div class="container">
                
                <!-- Row 2 -->
                <h5 class="white-text">Update Information</h5>
               <button type="button" class="btn btn-primary" id="infoButton">Toggle to View Form</button>

            <div class="card-panel hoverable cyan darken-4 row">
                    <form id="form1" class="col s6" method="post" action="adddoc">

                         <div class = "row">
                               <div class="input-field col s6">
                                  <input name="EID" type="text" class="validate">
                                  <label for="EID">EID</label>
                               </div>
                         </div>

                         <div class="row">
                                <div class="input-field col s6">
                                  <input name="Name" type="text" class="validate">
                                  <label for="Name">Name</label>
                                </div>
                         </div>

                         <div class="row">
                                <div class="input-field col s6">
                                  <input name="Gender" type="text" class="validate">
                                  <label for="Gender">Gender</label>
                                </div>
                         </div>

                         <div class = "row">
                               <div class="input-field col s6">
                                  <input name="Education" type="text" class="validate">
                                  <label for="Education">Education</label>
                               </div>
                         </div>

                         <div class="row">
                                <div class="input-field col s6">
                                  <input name="Speciality" type="text" class="validate">
                                  <label for="Speciality">Speciality</label>
                                </div>
                         </div>

                         <div class="row">
                                <div class="input-field col s6">
                                  <input name="Certifications" type="text" class="validate">
                                  <label for="Certifications">Certifications</label>
                                </div>
                         </div>
                        
                         <button class="btn btn-primary" >Update</button>
                    </form>
                
                          

            </div>

          <button type="button" class="btn btn-primary" id="info2Button">Toggle to View Servlet Information</button>
            <div class="card-panel hoverable cyan darken-4 row">
                    <form id="form2">
                     <%
                      
                         String abspath = application.getServerInfo();

                     %>
                     <div class = "row">
                        <h5 class="jagmod white-text">Server Information: <%= abspath%></h5>
                    <h5 class="jagmod white-text">ServletContext (Real Path) :<%=getServletContext().getRealPath("/")%></h5>
                    </div>
                    </form>
            </div>

         </div>
                 

        <script type="text/javascript">
            $("#infoButton").click(function(){$("#form1").toggle();});
            $("#info2Button").click(function(){$("#form2").toggle();});
        </script>
    </body>
</html>
