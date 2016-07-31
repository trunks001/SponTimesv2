<%--
    Document   : download
    Created on : 08 Jul 2015, 1:31:45 PM
    Author     : Bradley
--%>

<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.User"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="TwitterDownload.TwitterHandler" %>
<%@page import="TwitterDownload.TwitterExel" %>
<%@page import="TwitterDownload.dataFunctions" %>
<%@page import="twitter4j.Status" %>
<%@page import="twitter4j.ResponseList" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="jxl.*" %>
<%@page import="jxl.write.*" %>
<%@page import="javax.servlet.ServletOutputStream" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>


<%!
    dataFunctions data = new dataFunctions();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Ferret</title>
    </head>
    <body>
        <p>Your download  will begin shortly, please be patient</p>
        <%
            String ip = request.getHeader("X-Forwarded-For");  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("Proxy-Client-IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("WL-Proxy-Client-IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_CLIENT_IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getRemoteAddr();  
            }
            
            TwitterHandler tweeter = (TwitterHandler)session.getAttribute("tweeter");
            
            int pageSize = 1500;
            
            String filePath = null;
            
            String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
            
            int limit = tweeter.getRemainingRateLimit();
            
            String handel = tweeter.getScreenName();
            
            if(request.getParameter("twiterhandel") != null)
                handel = request.getParameter("twiterhandel");
            
            try
            {
                if(request.getParameter("submitFollowers") != null)
                {
                    List<User> userFollowers = tweeter.getUserFollowers(handel, pageSize);

                    if(userFollowers != null)
                    {
                        filePath =  TwitterExel.writeFollowers(tweeter.getUserID(), userFollowers, webRootPath);
                    }
                }
                else if(request.getParameter("submitFeed") != null)
                {
                    List<Status> userTweets = tweeter.getUserTimeline(handel, pageSize);

                    limit = tweeter.getRemainingRateLimit();

                    if(userTweets != null)
                    {
                        filePath =  TwitterExel.writeTweets(tweeter.getUserID(), userTweets, webRootPath);
                    }
                }
                else
                {
                    List<Status> userTweets = tweeter.getUserTimeline(handel, pageSize);

                    limit = tweeter.getRemainingRateLimit();

                    if(userTweets != null)
                    {
                        filePath =  TwitterExel.writeTweets(tweeter.getUserID(), userTweets, webRootPath);
                    }
                }
            }
            catch(TwitterException ex)
            {
                String s = ex.toString();
            }
            
            if(filePath != null)
            {
                File file = null;
                FileInputStream fis = null;
                ByteArrayOutputStream bos = null;

                Date d = new Date();
                d.toString();

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd_HHmmss");

                try {
                    response.setContentType("application/vnd.ms-excel");            
                    response.setHeader("Content-disposition", "attachment; filename=" + handel + "_" + dateFormat.format(d) + ".xls");
                    file = new File(filePath);
                    fis = new FileInputStream(file);
                    bos = new ByteArrayOutputStream();
                    int readNum;
                    byte[] buf = new byte[1024];
                    try {

                        for (; (readNum = fis.read(buf)) != -1;) {
                            bos.write(buf, 0, readNum);
                        }
                    } catch (IOException ex) {

                    } 
                    ServletOutputStream outs = response.getOutputStream();
                    bos.writeTo(outs);
                } catch (Exception e) {
                    // TODO: handle exception
                } finally {
                    int id = (int)session.getAttribute("userId");
                    data.saveDownload(id, filePath);
                    if (file != null) {
                        file = null;
                    }
                    if (fis != null) {
                        fis.close();
                    }
                    if (bos.size() <= 0) {
                        bos.flush();
                        bos.close();
                    }
                }
            }
        %>
    </body>
</html>
