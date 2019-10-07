<%-- 
    Document   : Admin
    Created on : Sep 30, 2019, 4:52:29 PM
    Author     : jagankaartik58
--%>


<!-- Admin Page Fully Functional -->


<%@page import="HealthRecord.Patient"%>
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
                        out.println("<table>");
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

                            Patient patient_obj[] = (Patient [])request.getAttribute("pobj");
                            

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

                            for(int i=0;i<patient_obj.length;++i) 
                            {
                                out.println("<tr>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getPatientID());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getFirst_name());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getLast_name());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getDOB());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getBloodGroup());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getAddress());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getPincode());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getPhoneNumber());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getMaritalStatus());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getAge());
                                    out.println("</td>");
                                    out.println("<td>");
                                    out.println(patient_obj[i].getSex());
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
