<%-- 
    Document   : Spon_Times_NavBar
    Created on : 13-Mar-2016, 21:13:56
    Author     : Trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Social Media News">
    <meta name="author" content="Spontaneous Times">

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
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
  
                <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <!-- Main header navigation button-->
                <a class="navbar-brand page-scroll" href="index.jsp">
                    <!-- The span keep the image inline with the text in the navigation bar-->
                    <span class="light"><img src="img/Spontaneous Times Icon-HR.png" alt="" height="auto" width="55"/>Spon</span>Times                  
                </a>
                
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                
                <!--Seach bar for searching for articles-->
                
                
                <!-- The other navigational buttons -->
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <%
                        boolean loggedin;
                        if(session.getAttribute("UserID") == null)
                            loggedin = false;
                        else
                            loggedin = true;
                        if (loggedin) 
                            out.print("<li><a class=\"page-scroll\" href=\"Spon_Times_Write_Article.html\">Write Article</a></li><li><a class=\"page-scroll\" href=\"#GlobalPaper\">Global Paper</a></li><li><a class=\"page-scroll\" href=\"logout.jsp\">Logout</a></li>");
                        else
                            out.print("<li><a class=\"page-scroll\" href=\"Spon_Times_UserRegistration.html\">Register</a></li> <li><form action=\"login.jsp\" class=\"page-scroll\" role=\"UsernameLogin\"><table><tr><td style=\"vertical-align:center\"><input type=\"text\" placeholder=\"Username\" name=\"username\" class=\"form-control\"></td><td style=\"vertical-align: center\"><input type=\"text\" placeholder=\"Password\" name=\"password\" class=\"form-control\"></td><td  style=\"vertical-align:center\"><input type=\"submit\" class=\"btn btn-default btn-lg\" value=\"login\"></td></tr></table></form></li>");
                    %>
                </ul>                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    </body>
</html>
