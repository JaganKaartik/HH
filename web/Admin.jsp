<%-- 
    Document   : Admin
    Created on : Sep 30, 2019, 4:52:29 PM
    Author     : jagankaartik58
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!-- Admin Page Fully Functional -->


<%@page import="HealthRecord.Patient"%>
<%@page import="HealthRecord.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Admin Page</title>

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
        <link rel="stylesheet" href="css/admin.css" type="text/css">

         <!-- External JavaScript File -->
        <script src="js/home.js"></script>

        <!-- Google Fonts -->

        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>

        <style type="text/css">
            
            body {
                font-family: 'Adamina';font-size: 22px;
            }
        </style>

    </head>
    <style type="text/css">
        #form1 {
        display:none;
        }
    </style>
    <body>

        <!-- CHECK IF THE ADMIN IS LOGGIN IN OR NOT USING SESSION TRACKING -->
        <!-- HTTP Session Management -->

        <%

            if(session.getAttribute("uname")==null)
            {
                response.sendRedirect("index.html");
            }

        %>

        <nav>
            <div class="nav-wrapper  green darken-2">
                <!-- HREF TO ABOUT.HTML -->
                <a href="#" class="brand-logo left">HygeaHealth+</a>
                <a href="#" class="brand-logo center">Admin Dashboard</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                <!-- <li><a href="http://localhost:8080/ElectronicHealthRecord/registerpatient.html">Register Patient</a></li>
                <li><a href="#">Billing/Discharge</a></li>
                <li><a href="http://localhost:8080/ElectronicHealthRecord/ViewPatient.jsp">View Patients</a></li>
                <li><a href="#">View Doctors</a></li> -->
                <!-- <li><a href="#">Schedule Appointment</a></li> -->
                <li>
                    <form action="logout" method="post">
                    <button type="submit" class="btn btn-primary">LogOut</button>
                    </form>
                </li>
                </ul>
            </div>
        </nav>


        <div class = "container">

            <div class = "card-panel light-blue row">
                <%

                // TO DISPLAY USER AND ROLE
                
                String username = (String)session.getAttribute("uname");  
                String role = (String)session.getAttribute("role");  

                 %>
                 <h6 class="white-text">Welcome! Admin: <%=username%></h6> 
            </div>

                <div class ="card-panel green darken-3 col s6 row">
                    <button type="button" class="btn btn-primary" id="formButton">Add User</button>
                    <form id="form1" onSubmit = "return checkPassword(this)" method="post" action="signup">
                        <input type="text" name="id" placeholder="Empoyee ID"/>
                        <input type="text" name="user" placeholder="Username"/>
                        <input type="text" name="role" placeholder="Role"/>
                        <input type="password" name="p1" placeholder="Password"/>
                        <input type="password" name="p2" placeholder="Confirm Password"/>
                        <input type="submit"/>
                    </form>
                </div>
            <div class = "card-panel light-green darken-3 col s6 row">
                <form method="get" action="viewAllUser">
                     <button type="submit" class="btn btn-primary">View All Users</button>
                </form>
                <% 
                    if(request.getAttribute("uname")!=null)
                    {
                        out.println("<br>");
                        out.println("<br>");
                        out.println("<table class=\"highlight\">");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Name</th>");
                        out.println("<th>Role</th>");
                        out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");

                        String unames[] = (String [])request.getAttribute("uname"); 
                        String roles[] = (String [])request.getAttribute("roles");

                        for(int i=0;i<unames.length;++i) 
                        {
                            out.println("<tr>");
                            out.println("<td>");
                            out.println(unames[i]);
                            out.println("</td>");
                            out.println("<td>");
                            out.println(roles[i]);
                            out.println("</td>");
                            out.println("</tr>");
                        }

                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
            </div>
            <div class = "card-panel light-green darken-3 col s6 row">
                <form method="get" action="viewAllPat">
                     <button type="submit" class="btn btn-primary">View All Patients</button>
                </form>
                <% 
                        if(request.getAttribute("pobj")!=null)
                        {
                            //Fetched the Array of Objects of type Patient

                            //Patient patient_obj[] = (Patient [])request.getAttribute("pobj");

                            List<Patient> pats = (ArrayList<Patient>)request.getAttribute("pobj");

                            

                            out.println("<br>");
                            out.println("<br>");
                            out.println("<table class=\"centered highlight\">");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th>Patient ID</th>");
                            out.println("<th>First Name</th>");
                            out.println("<th>Last Name</th>");
                            out.println("<th>Date of Birth</th>");
                            out.println("<th>Blood Group</th>");
                            out.println("<th>Address</th>");
                            out.println("<th>Pincode</th>");
                            out.println("<th>Phone Number</th>");
                            out.println("<th>Marital Status</th>");
                            out.println("<th>Age</th>");
                            out.println("<th>Sex</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            out.println("<tbody>");

                            for(Patient p : pats)
                            {
                                out.println("<tr>");
                                    out.println("<td>");
                                    out.println(p.getPatientID());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getFirst_name());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getLast_name());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getDOB());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getBloodGroup());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getAddress());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getPincode());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getPhoneNumber());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getMaritalStatus());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getAge());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(p.getSex());
                                    out.println("</td>");
                                out.println("</tr>");
                            }

                            out.println("</tbody>");
                            out.println("</table>");

                    }
                %>
            </div>
            <div class = "card-panel light-green darken-3 col s6 row">
                <form method="get" action="viewalldoc">
                     <button type="submit" class="btn btn-primary">View All Doctors</button>
                </form>

                 <!-- Output Dynamic Data from Doctor Details Servlet -->

                <%
                    if(request.getAttribute("doctors")!=null)
                    {
                        List<Doctor> docs = (ArrayList<Doctor>)request.getAttribute("doctors");

                            out.println("<br>");
                            out.println("<br>");
                            out.println("<table class=\"centered highlight\">");

                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th>Doctor ID</th>");
                            out.println("<th>Name</th>");
                            out.println("<th>Gender</th>");
                            out.println("<th>Education</th>");
                            out.println("<th>Speciality</th>");
                            out.println("<th>Certifications</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            
                            out.println("<tbody>");

                        for(Doctor d : docs)
                        {
                            out.println("<tr>");
                                out.println("<td>");
                                out.println(d.getEID());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(d.getName());
                                out.println("</td>");   
                                out.println("<td>");
                                out.println(d.getGender());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(d.getEducation());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(d.getSpeciality());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(d.getCertifications());
                                out.println("</td>");
                            out.println("</tr>");
                        }

                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
            </div>
        </div>
        <script type="text/javascript">
            $("#formButton").click(function(){$("#form1").toggle();});
        </script>
    </body>
</html>
