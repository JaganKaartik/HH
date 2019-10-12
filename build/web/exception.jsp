<%-- 
    Document   : exception
    Created on : Oct 12, 2019, 1:15:13 AM
    Author     : jagankaartik58
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% exception.printStackTrace(response.getWriter()); %>
    </body>
</html>
