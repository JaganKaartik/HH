<%-- 
    Document   : Reception
    Created on : Oct 6, 2019, 12:38:14 PM
    Author     : jagankaartik58
--%>
<%@page import="HealthRecord.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!-- Reception.JSP Page Complete -->

<html>
    <head>
        <title>Reception</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        <!-- Custom CSS -->

        <link rel="stylesheet" href="css/base.css" type="text/css">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
			    <a href="#" class="brand-logo center">Reception Dashboard</a>
			    <ul id="nav-mobile" class="left hide-on-med-and-down">
		        <li><a href="http://localhost:8080/ElectronicHealthRecord/registerpatient.html">Register Patient</a></li>
		        <li><a href="#">Billing/Discharge</a></li>
		        <li><a href="#">View Doctors</a></li>
                <li>
		        <form action="logout" method="post">
                    <button type="submit" class="btn btn-primary">LogOut</button>
                </form>
                </li>
		     	</ul>
		    </div>
  		</nav>

        <div class="container">

            <div class="card-panel light-blue row">

                <!-- Row 1 -->

                 <%
                    // TO DISPLAY USER AND ROLE
                    
                    String username = (String)session.getAttribute("uname");  
                    String role = (String)session.getAttribute("role");  

                %>

            <h6>Hello <%=role%> <%=username%></h6>

            </div>

            <div class="card-panel light-blue ">
                <!-- Row 2 -->
                    <h5 class="white-text">View Patient Details</h5>
                    <nav>
                        <div class="nav-wrapper">

                        <form method="get" action="patinfocontrol">
                            <div class="input-field">
                              <input name="ser" type="search" placeholder="Patient ID" required>
                              <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                              <i class="material-icons">close</i>
                            </div>
                        </form>
                        </div>
                    </nav>

                    <!-- Output Dynamic Data from Patient Information Control -->

                    <%
                        if(request.getAttribute("pDAO")!=null)
                        {
                            Patient patient_obj = (Patient)request.getAttribute("pDAO");

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
                            out.println("<tr>");
                                out.println("<td>");
                                out.println(patient_obj.getPatientID());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getFirst_name());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getLast_name());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getDOB());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getBloodGroup());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getAddress());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getPincode());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getPhoneNumber());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getMaritalStatus());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getAge());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(patient_obj.getSex());
                                out.println("</td>");
                            out.println("</tr>");
                            out.println("</tbody>");
                            out.println("</table>");
                        }
                    %>

            </div>

            <div class="card-panel light-blue row">
                 <h5 class="white-text">View Doctor Details</h5>
                 <nav>
                        <div class="nav-wrapper">
                            <form method="get" action="viewdoc">
                                <div class="input-field">
                                  <input name="ser" type="search" placeholder="Patient ID" required>
                                  <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                                  <i class="material-icons">close</i>
                                </div>
                            </form>
                        </div>
                </nav>
            </div>
        </div>

    </body>
</html>
