<%-- 
    Document   : headerPanel
    Created on : 08 Jul 2015, 1:26:07 PM
    Author     : Bradley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="TwitterDownload.TwitterHandler" %>

<%!
    String Name = " to TwExpert!";
    TwitterHandler tweeter = TwitterHandler.getInstance();
    
    //pages: 1 home; 2 download
    int pageNo = 1;
%>

<%
    String v = request.getParameter("verifier");
    
    if(v != null  && !v.equals("null"))
        tweeter.getAccessToken(v);
        
    String s = tweeter.getUserName();
    if(s != null)
        Name = s;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styles/layout.css">
    </head>
    
    <%
        pageNo = 1;
        String sPage = request.getParameter("download");
        if(sPage != null)
            pageNo = 2;
        else
        {
            sPage = request.getParameter("about");
            
            if(sPage != null) 
                pageNo = 3;
        }
    %>
    <body>
        <img style="position: absolute; right: 10px; top: 10px;" src="images/demo/ferret.png" alt="" />
        <div class="wrapper col1">
            <div id="head">
                <h1><a href="index.html">Data Ferret</a></h1>
                <p>Easily Get Twitter Timelines in Excel</p>
                <li class="last"><a class="swap" style="background-image:url(images/demo/logo.png);" href="#gallery"><strong>Company</strong><span><img src="images/demo/logo.png" alt="" /></span></a></li>
                <div id="topnav">
                  <ul>
                     <li><a <% if(pageNo == 1) out.print("class=\"active\""); %> href="index.jsp">Home</a></li>
                    <li><a <% if(pageNo == 2) out.print("class=\"active\""); %> href="report.jsp?type=0&download=1">Get Report</a>
                     <ul>
                        <li><a href="report.jsp?type=1&download=1">Once Off</a></li>
                        <li><a href="report.jsp?type=2&download=1">Contract</a></li>
                        <li><a href="report.jsp?type=0&download=1">FREE Trial</a></li>
                      </ul> 
                    <li><a <% if(pageNo == 3) out.print("class=\"active\""); %> href="about.jsp?about=1">About Us</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <%
                    if(tweeter.getAccessToken() == null)
                    {
                        String a = tweeter.getRequestToken().getAuthorizationURL();
                        out.println("<li class=\"last\"><a href=\"" + a + "\">Log In</a></li>");
                    }
                    %>
                  </ul>
                </div>
            </div>
            <div style="float:left">
                <%
                    if(tweeter.getAccessToken() == null)
                    {
                        String a = tweeter.getRequestToken().getAuthorizationURL();
                        out.println("<a href=\"" + a + "\">LOGIN WITH TWITTER!</a>");
                    }
                    else
                    {
                        out.println("<p style=\"color: black\">Welcome " + tweeter.getScreenName() + " to Data Ferret!</p>");
                    }
                %>
                
            </div>
        </div>
    </body>
</html>
