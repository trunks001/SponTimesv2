<%-- 
    Document   : debug
    Created on : Aug 13, 2016, 1:12:01 PM
    Author     : dvt
--%>

<%@page import="TwitterDownload.TwitterHandler"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="TwitterDownload.DataMethods" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //*** Check that the correct users are accessing this page ***
            TwitterHandler tweeter = (TwitterHandler)session.getAttribute("tweeter");
            if(tweeter == null || tweeter.getScreenName() == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            String handle = tweeter.getScreenName();
            if(!handle.equalsIgnoreCase("ferret_data") && !handle.equalsIgnoreCase("lerinaidoo") && !handle.equalsIgnoreCase("Bones2804")) {
                response.sendRedirect("index.jsp?logged=1");
            }
            out.println("<div class=\"col-md-12 to-animate\"> ");    
           
            //*** Today's downloads ***
            int numberOfDownloadsToday = 0; //TODO 
            out.println("<div class=\"row\"> " +
                        "<p>Today's downloads: " + numberOfDownloadsToday + 
                    "</div>");
            
            //*** Total downloads ***
            int numberOfDownloadsEver = 0; //TODO
            out.println("<div class=\"row\"> " +
                        "<p>Total downloads ever: " + numberOfDownloadsEver + 
                    "</div>");
            
            //*** Query form ***
            out.println("<div class=\"col-md-12 to-animate\"> "+ 
                        "<form class=\"download to-animate\" action=\"debug.jsp\">" +
                            "<fieldset>" + 
                                "<div class=\"row\" >" +     
                                    "<span>SQL query: </span><input id=\"sqlQuery\" name=\"sqlQuery\" style=\"width: 40%;\" />" +
                                "</div>" +     
                                "<div class=\"row\" style=\"padding-top: 4px;\" >" +     
                                    "<span>DB Url (optional): </span><input id=\"dbUrl\" name=\"dbUrl\" style=\"width: 40%;\" />" +
                                "</div>" +    
                                "<div class=\"row\" style=\"padding-top: 4px;\" >" + 
                                    "<span>DB Name (optional): </span><input id=\"dbName\" name=\"dbName\" style=\"width: 40%;\" />" +
                                "</div>" +     
                                "<div class=\"row\" style=\"padding-top: 4px;\" >" + 
                                    "<span>DB Username (optional): </span><input id=\"dbUsername\" name=\"dbUsername\" style=\"width: 40%;\" />" +
                                "</div>" +     
                                "<div class=\"row\" style=\"padding-top: 4px;\" >" + 
                                    "<span>DB Password (optional): </span><input id=\"dbPassword\" name=\"dbPassword\" style=\"width: 40%;\" />" +
                                "</div>" +     
                                "<div class=\"row\" style=\"padding-top: 4px;\">" + 
                                    "<input id=\"submitQuery\" name=\"submitQuery\" type=\"submit\" />" +
                                "</div>" +     
                            "</fieldset>" +
                        "</form>");
            
            out.println("</div>");
             
            //*** Query results ***
            if(request.getParameter("submitQuery") != null)
            {
                out.println("<div class=\"row\" style=\"padding-top: 8px;\"> " + 
                        "Query results: "+ 
                            "</div>");  
                
                String query = "";
                
                if(request.getParameter("sqlQuery") != null) {
                    query = request.getParameter("sqlQuery").trim();
                    //This debug page should only be used for debugging, NOT making changes to the db.
                    //Thus, the only sql queroes allowed are select queries.
                    if(!query.split(" ")[0].equalsIgnoreCase("select")) {
                        response.sendRedirect("index.jsp");
                        return;
                    }
                }
                
                String dbUrl, dbName, dbUsername, dbPassword;
                dbUrl = request.getParameter("dbUrl");
                dbName = request.getParameter("dbName");
                dbUsername = request.getParameter("dbUsername");
                dbPassword = request.getParameter("dbPassword");
                
                ResultSet result = DataMethods.getDebugData(query, dbUrl, dbName, dbUsername, dbPassword);
                ResultSetMetaData metaData = result.getMetaData();
                
                //*** Column headers ***
                int columnCount = metaData.getColumnCount();
                String columnNames = "| ";
                for(int i = 1; i <= columnCount; i++) {
                    columnNames += metaData.getColumnLabel(i) + " | ";
                }
                
                out.println("<div class=\"row\"> " + columnNames + 
                            "</div>");  
                
                //*** Values ***
                while(result.next()) {
                    String columnValues = "| ";
                    for(int i = 1; i <= columnCount; i++) {
                        columnValues += result.getString(i) + " | ";
                    }
                    
                    out.println("<div class=\"row\" style=\"padding-top: 8px;\"> " + columnValues + 
                            "</div>");   
                }
            }
        %>
        
        
    </body>
</html>
