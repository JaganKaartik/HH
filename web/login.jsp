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
        <title>Login JSP Page</title>
    </head>
    <body>
        <h1>Testing Control Flow</h1>
        <%
            String url = "jdbc:postgresql://localhost:5432/Electronic_Health_Record";
            String username = "postgres";
            String sql = "select * from public.\"User\" ";
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url,username,"qpalzmwer");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
        %>
        
            <%= rs.getString(1)%>
    </body>
</html> 
