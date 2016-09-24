<%--
    Document   : download
    Created on : 08 Jul 2015, 1:31:45 PM
    Author     : Bradley
--%>

<%@page import="java.util.Map"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.User"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="TwitterDownload.TwitterHandler" %>
<%@page import="TwitterDownload.TwitterExel" %>
<%@page import="TwitterDownload.DataMethods" %>
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

<%@ page import = "java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="5; url=http://www.dataferret.co.za">
</head>
<body>
Thank you for using Data Ferret! You will return shortly
</body>
</html>

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
            
            String[] values;
            
            Map<String, String[]> parameters = request.getParameterMap();
            for(String parameter : parameters.keySet()) {
                if(parameter.toLowerCase().startsWith("question")) {
                    values = parameters.get(parameter);
                    //your code here
                }
            }
            
            TwitterHandler tweeter = (TwitterHandler)session.getAttribute("tweeter");
            
            int pageSize = 500;
            if(request.getParameter("page_size") != null) {
                pageSize = Integer.parseInt(request.getParameter("page_size"));
            } else if(session.getAttribute("page_size") != null) {
                pageSize = Integer.parseInt(session.getAttribute("page_size").toString());
            }
            
            if(request.getParameter("search_type") != null && request.getParameter("search_type").contains("1500"))
                pageSize = 1500;
            
            String filePath = null;
            
            String webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
            
            int limit = tweeter.getRemainingRateLimit();
            
            String handel = tweeter.getScreenName();
            
            if(handel.equalsIgnoreCase("ferret_data"))
                pageSize = 36000;
            
            if(request.getParameter("search_phrase") != null) {
                handel = request.getParameter("search_phrase");
            } else if(session.getAttribute("search_phrase") != null) {
                handel = session.getAttribute("search_phrase").toString();
            }    
            
            try
            {
                if(request.getParameter("search_type") != null || session.getAttribute("search_type") != null)
                {
                    if((request.getParameter("search_type") != null && request.getParameter("search_type").equals("followers")) || (session.getAttribute("search_type") != null && session.getAttribute("search_type").toString().equals("followers")))
                    {
                        List<User> userFollowers = tweeter.getUserFollowers(handel, pageSize);

                        if(userFollowers != null && userFollowers.size() > 0)
                        {
                            filePath =  TwitterExel.writeFollowers(tweeter.getUserID(), userFollowers, webRootPath);
                        }
                        else
                            response.sendRedirect("error.html");
                        //TO DIFFERENT ERROR PAGE
                    }
                    else if((request.getParameter("search_type") != null && request.getParameter("search_type").equals("tweets")) || (session.getAttribute("search_type") != null && session.getAttribute("search_type").equals("tweets")))
                    {
                        List<Status> userTweets = tweeter.getUserTimeline(handel, pageSize);

                        limit = tweeter.getRemainingRateLimit();

                        if(userTweets != null && userTweets.size() > 0)
                        {
                            filePath =  TwitterExel.writeTweets(tweeter.getUserID(), userTweets, webRootPath);
                        }
                        else
                            response.sendRedirect("error.html");
                        //TO DIFFERENT ERROR PAGE
                    }
                }
                else
                {
                    List<Status> userTweets = tweeter.getUserTimeline(handel, pageSize);

                    limit = tweeter.getRemainingRateLimit();

                    if(userTweets != null && userTweets.size() > 0)
                    {
                        filePath =  TwitterExel.writeTweets(tweeter.getUserID(), userTweets, webRootPath);
                    }
                    else
                        response.sendRedirect("error.html");
                    //TO DIFFERENT ERROR PAGE
                }
            }
            catch(TwitterException ex)
            {
                String s = ex.toString();
                response.sendRedirect("error.html");
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
                        String s = ex.toString();
                    } 
                    ServletOutputStream outs = response.getOutputStream();
                    bos.writeTo(outs);
                } catch (Exception e) {
                    response.sendRedirect("error.html");
                } finally {
                    int id = Integer.parseInt(session.getAttribute("userId").toString());
                    double price = Double.parseDouble(session.getAttribute("priceZAR").toString());
                    String productId = session.getAttribute("productId").toString();
                    DataMethods.saveDownload(id, filePath, productId, price);
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
                    session.setAttribute("page_size", null);
                    session.setAttribute("search_type", null);
                    session.setAttribute("search_phrase", null);
                    session.setAttribute("priceZAR", null);
                    session.setAttribute("productId", null);
                }
            }
%>