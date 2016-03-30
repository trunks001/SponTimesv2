<%-- 
    Document   : readarticle
    Created on : Mar 30, 2016, 6:33:46 PM
    Author     : trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Spon_Times_NavBar.jsp"  %>
        <%@page import="java.util.*" %>
        <!-- Intro Header -->
        <header class="intro">
            <div class="intro-body">

                <div class="container">

                    <div class="row">
                        <div> 
                                <img class="img-responsive img-circle" src="img/Spontaneous Times Logo-HR.png" alt=""/>
                            </div>
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
        
     <!-- Read Article Content -->   
    <section id="ReadArticle" class="container content-section text-center">
            <div class="container">
                <div class="row">                 
                              
                 
                    <%
                    String html = "";                                      

                    //Random number generator between 1 and 4
                    int min = 1;
                    int max = 4;
                                         
                    Random rn = new Random();
                    int range = max - min + 1;
                    int randomNum =  rn.nextInt(range) + min;                       
                    
                    //Generate article depending on the random number
                         switch(randomNum){
                             case 1:
                                 html = "<p>Article 1</p>";
                                 break;
                             case 2:
                                 html = "<p>Article 2</p>";
                                 break;
                             case 3:
                                 html = "<p>Article 3</p>";
                                 break;
                             case 4:
                                 html = "<p>Article 4</p>";
                                 break;
                             default:
                                 html = "undefined";
                                break;
                                        
                         }                      
              
                     
                     out.print(html);

                    %>
                </div>
            </div>
        </div>    
    </body>
</html>
