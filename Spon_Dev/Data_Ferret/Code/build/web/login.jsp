<%-- 
    Document   : login
    Created on : 16 Jul 2015, 2:27:27 PM
    Author     : Bradley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="twitter4j.Paging"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="twitter4j.Status"%>
<%@page import="TwitterDownload.TwitterHandler" %>

<%!
    TwitterHandler tweeter = TwitterHandler.getInstance("http://localhost:8080/TwiiterDownlod");
    private static String a;
    private static AccessToken accessToken = null;
%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
                if(tweeter.getAccessToken() == null)
                {
                    out.println("<form action=\"tryusfree.jsp\">PIN: <input type=\"text\" name=\"pin\"><br><input type=\"submit\" value=\"Submit\"></form>");
                    out.println("<a href=\"" + a + "\" target=\"_blank\">GET YOUR PIN HERE!</a>");
                }
            %>
    </body>
</html>
