<%-- 
    Document   : cancel
    Created on : Aug 27, 2016, 2:12:59 PM
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("search_type", null);
    session.setAttribute("search_phrase", null);
    session.setAttribute("page_size", null);
    response.sendRedirect("index.jsp");
%>