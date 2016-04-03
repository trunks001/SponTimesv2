<%-- 
    Document   : error
    Created on : 03 Apr 2016, 8:43:12 PM
    Author     : Bones
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            out.print(request.getParameter("message"));
        %>
    </body>
</html>
