<%-- 
    Document   : review
    Created on : Aug 16, 2016, 7:43:33 PM
    Author     : dvt
--%>

<%@page import="TwitterDownload.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm order of </title>
        
        <%
            Product product = (Product) session.getAttribute("product");
            out.println("<title>Confirm order of " + product.getName() + "</title>");
        %>
    </head>
    <body>
        <%
            
            out.println("<div class=\"col-md-12 to-animate\"> " +
                    "<div class=\"row\" >" + 
                        "<span>Product: " + product.getName() + "</span>" +
                    "</div>" +
                        "<span>Price: " + product.getPrice() + "</span>" +
                    "</div>" +
                    "<div>");
        %>
    </body>
</html>
