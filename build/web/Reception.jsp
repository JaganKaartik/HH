<%-- 
    Document   : Reception
    Created on : Oct 6, 2019, 12:38:14 PM
    Author     : jagankaartik58
--%>

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

   <!--      <style type="text/css">
            
            
        </style>
 -->
    </head>

    <body>

        <!-- CHECK IF USER IS LOGGIN IN OR NOt USING SESSION TRACKING -->

        <%

            if(session.getAttribute("uname")==null)
            {
                response.sendRedirect("index.html");
            }

        %>

        <!-- Static Web Page that links to a Dynamic Page -->

		 <nav>
		    <div class="nav-wrapper light-blue darken-3">
		    	<!-- HREF TO ABOUT.HTML -->
			    <a href="#" class="brand-logo right">HygeaHealth+</a>
			    <a href="#" class="brand-logo center">Dashboard</a>
			    <ul id="nav-mobile" class="left hide-on-med-and-down">
		        <li><a href="http://localhost:8080/ElectronicHealthRecord/registerpatient.html">Register Patient</a></li>
		        <li><a href="#">Billing/Discharge</a></li>
		        <li><a href="http://localhost:8080/ElectronicHealthRecord/ViewPatient.jsp">View Patients</a></li>
		        <li><a href="#">View Doctors</a></li>
                <li>
		        <form action="logout" method="post">
                    <button type="submit" class="btn btn-primary">LogOut</button>
                </form>
                </li>
		     	</ul>
		    </div>
  		</nav>

        <div class="alert alert-success alert-dismissible fade show">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>Successfully loggin in!</strong> 
        </div>

        <div class="container">
        <div class="row">

          <div class="card-panel teal-lighten-2 col s3">

            <!-- Grey navigation panel -->

             <%
                // TO DISPLAY USER AND ROLE
                
                String username = (String)session.getAttribute("uname");  
                String role = (String)session.getAttribute("role");  

            %>

            <h6>Hello <%=role%> <%=username%></h6>
          </div>

          <div class="card-panel teal-lighten-2 col s3">
            <!-- Teal page content  -->

            <h3 class="black-text">Testing JDBC Values ${pDAO.getFirst_name()}</h3>
            

          </div>
      </div>
        </div>
    </body>
</html>
