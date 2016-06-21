<%-- 
    Document   : tryusfree
    Created on : 16 Jul 2015, 11:05:14 AM
    Author     : Bradley
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="twitter4j.Paging"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="twitter4j.Status"%>
<%@page import="TwitterDownload.TwitterHandler" %>
<%@page import="TwitterDownload.TwitterExel" %>

<%!
    TwitterHandler tweeter = TwitterHandler.getInstance();
    private String pin = "";
    private static AccessToken accessToken = null;
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/layout.css">
        <title>TwexPert:Free</title>
    </head>
    <body>
        <%
            pin = request.getParameter("pin");
            if(pin != null)
                accessToken = tweeter.getAccessToken(request.getParameter("pin"));
            else
                accessToken = tweeter.getAccessToken();
            
            if(request.getParameter("download") != null)
            {
                try
                {
                    response.setContentType("application/octet-stream");
                    
                    String name = request.getParameter("account");
                    if(name == null || name == "")
                        name = tweeter.getUserName();
                    
                    response.setHeader("Content-Disposition","attachment;filename=" + name+ ".xls");
                    
                    File file = new File("C:\\tweets\\" + tweeter.getUserID() + ".xls");
                    FileInputStream fileIn = new FileInputStream(file);
                    ServletOutputStream serveOut = response.getOutputStream();

                    byte[] outputByte = new byte[4096];
                    //copy binary contect to output stream
                    while(fileIn.read(outputByte, 0, 4096) != -1)
                    {
                            serveOut.write(outputByte, 0, 4096);
                    }
                    fileIn.close();
                    serveOut.flush();
                    serveOut.close();
                }
                catch(IOException ex)
                {
                }
            }
        %>
        <div class="wrapper col1">
            <jsp:include page="headerPanel.jsp" />
        </div>
        <%-- <jsp:include page="login.jsp">
            <jsp:param name="pin" value="<%= pin %>" />
        </jsp:include> --%>
        
        <%
            if(accessToken != null)
                out.println("<form action=\"tryusfree.jsp\"><input name=\"account\" type=\"text\"><input name=\"getTweets\" type=\"submit\" value=\"getTweets\"><input name=\"download\" type=\"submit\" value=\"download\"></form>"); 
        %>
        <div class="wrapper col4">
            <table>
            <%
                if(accessToken != null)
                {   
                    String user = request.getParameter("account");
                    if(user == null)
                        user = tweeter.getScreenName();

                    ResponseList<Status> rl = tweeter.getUserTimeline(user, 3200);

                    TwitterExel.clearBuffer(tweeter.getUserID());
                    
                    TwitterExel.writeTweets(tweeter.getUserID(), rl);

                    for(int i = 0; i < rl.size(); i++)
                    {
                        Status s = rl.get(i);
                        String line = "<tr><td>" + s.getText() + "</td><td>"  + s.getCreatedAt() + "</td><td>" + s.getRetweetCount() + "</td><td>" + s.getFavoriteCount() + "</td></tr>";

                        out.println(line);
                    }
                }
            %>
            </table>
        </div>
    </body>
</html>
