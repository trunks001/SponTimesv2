<%--
    Document   : download
    Created on : 08 Jul 2015, 1:31:45 PM
    Author     : Bradley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="TwitterDownload.TwitterHandler" %>
<%@page import="TwitterDownload.TwitterExel" %>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Ferret</title>
    </head>
    <body>
        <p>Your download  will begin shortly, please be patient</p>
        <%
            TwitterHandler tweeter = TwitterHandler.getInstance();
            
            int pageSize = 1500;
            
            int limit = tweeter.getRemainingRateLimit();
            
            String handel = tweeter.getScreenName();
            
            if(request.getParameter("twiterhandel") != null)
                handel = request.getParameter("twiterhandel");
            
            List<Status> userTweets = tweeter.getUserTimeline(handel, pageSize);
            
            limit = tweeter.getRemainingRateLimit();
            
            if(userTweets != null)
            {
                String filePath;

                filePath =  TwitterExel.writeTweets(tweeter.getUserID(), userTweets);
                /*
                String filename = "Report_" + handel + ".xls";

                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition","attachment;filename="+ filename);

                File file = new File(filePath);
                FileInputStream fileIn = new FileInputStream(file);

                int i;
                //copy binary contect to output stream
                while((i=fileIn.read())!=-1)
                {
                        out.write(i);
                }
                fileIn.close();
                out.flush();
                out.close();
                */
                
                Date d = new Date();
                d.toString();
                
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HHmmss");
                
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-Disposition", "attachment; filename=" + handel + ":" + dateFormat.format(d) + ".xls");
                
                File excelFile = new File(filePath);
                
                Workbook workbook = Workbook.getWorkbook(excelFile);
                WritableWorkbook w = Workbook.createWorkbook(response.getOutputStream(), workbook);
                w.write();
                w.close();
            }
        %>
    </body>
</html>
