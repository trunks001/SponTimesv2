<%-- 
    Document   : index.jsp
    Created on : Mar 25, 2016, 12:28:19 PM
    Author     : trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.dataFunctions" %>
<%@page import="java.sql.*" %>
<%@page import="mypackage.article" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Social Media News">
        <meta name="author" content="Spontaneous Times">
        <script src="js/masonry.pkgd.min.js"></script>
        <script src="https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/index.css">
        
        <title>Spontaneous Times Landing Page</title>
        
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/grayscale.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <%@include file="Spon_Times_NavBar.jsp"  %>
        
        <!-- Intro Header -->
        <header class="intro">
            <div class="intro-body">

                <div class="container">
                    <div class="row">
                        <div> 
                            <img class="img-responsive img-circle" src="img/Spontaneous Times Logo-HR.png" alt=""/>
                        </div>
                    </div>
                    <div class='row'>
                        <div class="col-md-8 col-md-offset-2">
                            <p class="intro-text">A community of writers<br>Read the news that matters to you</p>
                            <a href="#GlobalPaper" class="btn btn-circle page-scroll">
                                <i class="fa fa-angle-double-down animated"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <section id="GlobalPaper" class="container content-section text-center">
            <div class="container">
                <div class="row">
                    
                  <%
                  dataFunctions dat = new dataFunctions();
                    ResultSet res = dat.getData("SELECT * FROM ArticleTrailers");
                    String html = "";
                    html += "<div class=\"grid\" style=\"height:auto;\" data-masonry='{ \"columnWidth\": 120 }'>";
                    while(res.next()) 
                    {
                        article art = new article(res.getString("trailerHeader"), res.getString("trailerBody"));
                        html += "<a href=\"readarticle.jsp?articleID=" + res.getInt("fkArticleID") + "\"><div class=\"grid-item\" style=\"height: auto; width: " + art.getWidth() + "px\"><h3>" + art.printTrailer() + "</h3>";
                        html += "</div>";
                        html += "</a>";
                    }
                    html += "</div>";
                    System.out.println("HTML on index: " + html);
                    dat.closeConnection();
                    out.print(html);
                  %>
                    
                </div>
            </div>
        </section>
    </body>
</html>
