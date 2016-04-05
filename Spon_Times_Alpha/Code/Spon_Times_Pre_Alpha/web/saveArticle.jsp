<%-- 
    Document   : saveArticle
    Created on : 03 Apr 2016, 11:03:02 PM
    Author     : Bones
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.dataFunctions" %>
<%@page import="mypackage.article" %>
<!DOCTYPE html>
<%
    String content = request.getParameter("content");
    
    int start = content.indexOf("</h1>") + 5;
    String header = content.substring(0, start + 1);
    
    
    String body = content.substring(start, content.length());
    int id = -1;
    article art = new article(header, body);
    try{
        id = art.save();
    }
    catch(SQLException ex){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "error.jsp?message=" + ex.toString()); 
    }
    catch(ClassNotFoundException ex){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "error.jsp?message=" + ex.toString()); 
    }
    
    if(id > 0){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "readarticle.jsp?articleID=" + id);
    }
    else{
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "error.jsp?message=Error saving article");
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
