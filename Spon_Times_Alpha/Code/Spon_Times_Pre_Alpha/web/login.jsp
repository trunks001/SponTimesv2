<%-- 
    Document   : login
    Created on : Mar 25, 2016, 12:26:05 PM
    Author     : trunks
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="mypackage.dataFunctions" %>
<!DOCTYPE html>
<%
    String user = request.getParameter("username");
    String pword = request.getParameter("password");
    
    dataFunctions dat = new dataFunctions();
    try{
        ResultSet rs = dat.getData("SELECT password FROM accounts WHERE username = '" + user + "'");
        
        if(rs != null && rs.next()){
            String s = rs.getString("password");
            if(s.equals(pword)){
                session.setAttribute("UserID", "1");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "index.jsp"); 
            }
        }
    }
    catch(SQLException ex){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "error.jsp?message=" + ex.toString()); 
    }
    catch(ClassNotFoundException ex){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "error.jsp?message=" + ex.toString()); 
    }
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
