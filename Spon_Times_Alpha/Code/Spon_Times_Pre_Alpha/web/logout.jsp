<%-- 
    Document   : logout
    Created on : Mar 25, 2016, 1:04:02 PM
    Author     : trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("UserID", null);
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "index.jsp"); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
