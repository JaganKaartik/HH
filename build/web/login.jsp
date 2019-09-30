<%-- 
    Document   : login
    Created on : Sep 30, 2019, 3:20:02 AM
    Author     : jagankaartik58
--%>
<%@page import="java.sql.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Redirect Page</title>
    </head>
    <body>
        <%
            String checkname = request.getParameter("user");
            String checkpass = request.getParameter("password");
            String db_url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
            String db_username = "postgres";
            String sql = "select * from public.\"User\" ";
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(db_url,db_username,"qpalzmwer");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int flag = 1;
            while (rs.next()) 
            {
                String uname = rs.getString("username");
                String psswrd = rs.getString("password");
               
                if(uname.equals(checkname)&&psswrd.equals(checkpass))
                {
                     out.println("Login Verified");
                     String role = rs.getString("role"); 
                     if(role=="Admin")
                     {
                         /* Redirect to Admin Page */
                     }
                     else if(role=="Receptionist")
                     {  
                          /* Redirect to Receptionist Page */
                     }
                     else if(role=="Doctor")
                     {
                          /* Redirect to Doctor Page */
                     }
                     flag = 0;
                     break;
                }
            }
            if(flag==1)
            {
                out.println("User! Not Found");
            }
        %>
        
          
    </body>
</html> 
