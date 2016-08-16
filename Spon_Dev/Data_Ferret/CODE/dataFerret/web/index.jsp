<%-- 
    Document   : index
    Created on : 13 Jul 2016, 5:57:26 PM
    Author     : Bones
--%>

<%@page import="twitter4j.User"%>
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
<%@page import="TwitterDownload.TwitterExel" %>
<%@page import="TwitterDownload.DataMethods" %>
<%@page import="java.io.*" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="jxl.*" %>
<%@page import="jxl.write.*" %>
<%@page import="java.sql.*" %>

<%!
    TwitterHandler tweeter;
    private String a;
    String pin;
%>

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
    
    String callBack = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/index.jsp?logged=1";
    
    if(request.getParameter("logged") == null || session.getAttribute("tweeter") == null)
    {
        session.setAttribute("tweeter", tweeter = new TwitterHandler());
        session.setAttribute("accessToken", null);
    }
    else
        tweeter = (TwitterHandler)session.getAttribute("tweeter");
        
    pin = request.getParameter("oauth_verifier");
    
    if(session.getAttribute("accessToken") == null)
    {   
        if(pin != null  && !pin.equals("null"))
        {
            AccessToken access = tweeter.getAccessToken(pin);
            if(access != null)
            {
                session.setAttribute("accessToken", access);
                long twitterUserId = tweeter.getUserID();
                session.setAttribute("twitterUserId", twitterUserId);
                String screenName = tweeter.getScreenName();
                String userName = tweeter.getUserName();
                int user = DataMethods.saveUser(twitterUserId, screenName, userName);
                if(user > 0)
                {
                    DataMethods.saveLogin(user, ip);
                    session.setAttribute("userId", user);
                }
                response.sendRedirect("?logged=1");
            }
        }
        else
        {
            a = tweeter.auth(callBack);
        }
    }
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Data Ferret - Download Twitter Data</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Website for downloading Twitter data as MS Excel documents" />
        <meta name="keywords" content="Twitter data downloads as MS Excel documents" />
        <meta name="author" content="Spontaneous Ventures" />

       
        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">

        <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css'>

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Simple Line Icons -->
        <link rel="stylesheet" href="css/simple-line-icons.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">


        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <header role="banner" id="fh5co-header">
            <div class="fluid-container">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <!-- Mobile Toggle Menu Button -->
                        <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                        
                        <a class="navbar-brand" href="index.jsp">
                            <img class="brand-slogan" src="images/ferret.png" alt="Data Ferret logo"><span>D</span>ata Ferret
                        </a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#" data-nav-section="home"><span>Home</span></a></li>
                            <li><a href="#" data-nav-section="pricing"><span>Pricing</span></a></li>  
                            <li><a href="#" data-nav-section="explore"><span>Demo Report</span></a></li>                       
                            <li><a href="#" data-nav-section="faq"><span>FAQ</span></a></li>
                            <li><a href="#" data-nav-section="footer"><span>Contact Us</span></a></li>
                            
                            <%
                                if(session.getAttribute("accessToken") == null)
                                {                                   
                                    out.println("<li class=\"call-to-action\"><a class=\"external\" href=\"" + a + "\"><span><i class=\"icon-twitter\"></i>Sign In With Twitter</span></a></li>");
                                }
                                else
                                {
                                    try
                                    {
                                        out.println("<li class=\"navbar2\"><a href=\"#\"<span>Welcome " + tweeter.getUserName() + "!</span></a></li>");
                                    }
                                    catch(Exception ex){
                                        response.sendRedirect("error.html");
                                    }
                                }
                            %>   
                            
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <section id="fh5co-home" data-section="home" style="background-image: url(images/twitterdata.png);" data-stellar-background-ratio="0.5">
            <div class="gradient">
            <div class="container">
                <div class="text-wrap">
                    <div class="text-inner">
                        <div class="col-md-12">
                             <div class="row" style="margin-top: 20px;">
                                <h1 class="to-animate">Welcome To Data Ferret</h1>
                                <img src="images/ferret.png" alt=""/>
                             </div>
                            <div class="row" style="padding-top: 10px;">
                                <p style="font-weight: bold;">We are currently in BETA! Try us for free!</p>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div id="subheading">
                                    <div>Easily Get Twitter Timelines in Excel</div> 
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div class="call-to-action">
                                    <%
                                        if(session.getAttribute("accessToken") == null)
                                        {
                                            out.println("<a href=\"" + a + "\" class=\"demo to-animate\"><i class=\"icon-twitter\"></i>Sign In with Twitter</a>");
                                        }
                                        else
                                        {
                                            out.println("<div class=\"col-md-12 to-animate\">");                                      
                                                out.println("<form class=\"download to-animate\" action=\"download.jsp\">");
                                                    out.println("<fieldset>");
                                                        out.println("<div class=\"row\">");
                                                            out.println("<input id=\"twitterhandel\" style=\"width: 40%; min-width: 350px; display: inline-block; \" class=\"form-control\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Use the @ sign as a prefix to download a Twitter user's tweets or timeline.&#013 Use the # sign as a prefix to download the Twitter data for the specific hashtag.&#013 Use a keyword to search for Twitter data based on a particular keyword\" placeholder=\"Search text. Hover over for usage tips\" name=\"twiterhandel\" type=\"text\" />");
                                                        out.println("</div>");
//                                                        out.println("<div class=\"row\" style=\"width: 40%; min-width: 350px; display: inline-block; text-align: left;\"><p style=\"font-weight: bold;\">Use the @ sign as a prefix to download a Twitter user's tweets or timeline.&#013 Use the # sign as a prefix to download the Twitter data for the specific hashtag.&#013 Use a keyword to search for Twitter data based on a particular keyword</p></div>");
                                                        out.println("<div class=\"row\" style=\"padding-top: 8px;\">");
                                                            out.println("<input class=\"download to-animate\" id=\"submitform\" name=\"submitFeed\" type=\"submit\" value=\"Download Twitter Data\" />");
                                                            out.println("<input class=\"download to-animate\" id=\"submitform\" name=\"submitFollowers\" type=\"submit\" value=\"Download Twitter Followers\" />");
                                                            out.println("</div>");
                                                    out.println("</fieldset>");
                                                out.println("</form>");
                                            out.println("</div>");
                                        }
                                    %>
                                    
                                </div>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
              
        </section>
                                    
        <section id="fh5co-pricing" data-section="pricing">
            <div class="fh5co-pricing">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 section-heading text-center">
                            <h2 class="to-animate">Select One of the Plans Below</h2>
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 subtext">
                                    <h3 class="to-animate">As soon as you have made your secure purchase via your PayPal account, Data Ferret gets to work on downloading your data. As soon as it is ready you are sent an e-mail notifying you that your download is ready.</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="pricing">
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Starter</h2>
                                    <div class="price"><sup class="currency">$</sup>1.99</div>
                                    <div class="price small"><p>No. of Tweets = 500</p></div>
                                    <a href="" class="btn btn-select-plan btn-sm" >Coming Soon</a>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Beginner</h2>
                                    <div class="price"><sup class="currency">$</sup>2.99</div>
                                    <div class="price small"><p>No. of Tweets = 1500</p></div>
                                    <a href="" class="btn btn-select-plan btn-sm">Coming Soon</a>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Basic</h2>
                                    <div class="price"><sup class="currency">$</sup>3.99</div>
                                    <div class="price small"><p>No. of Tweets = 3000</p></div> 
                                    <a href="" class="btn btn-select-plan btn-sm">Coming Soon</a>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Intermediate</h2>
                                    <div class="price"><sup class="currency">$</sup>4.99</div>
                                    <div class="price small"><p>No. of Tweets = 6000</p></div>                                       
                                    <a href="" class="btn btn-select-plan btn-sm">Coming Soon</a>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Expert</h2>
                                    <div class="price"><sup class="currency">$</sup>6.99</div>                                    
                                    <div class="price small"><p>No. of Tweets = 12000</p></div>
                                        <a href="" class="btn btn-select-plan btn-sm">Coming Soon</a>
                                </div>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-4">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Buffet</h2>
                                    <div class="price"><sup class="currency">$</sup>???</div>
                                        <div class="price small"><p>Contact us for more than 12K Tweets</p></div>
                                        <a href="mailto: info@dataferret.co.za" class="btn btn-select-plan btn-sm">Contact Us</a>
                                        </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
                   
        <%
            if(session.getAttribute("accessToken") == null)
            {
                out.println("<div class=\"getting-started getting-started-1\">"
                    + "<div class=\"container\">"
                       + "<div class=\"row\">"
                           + "<div class=\"col-md-6 to-animate\">"
                               + "<h3>Get Started Here</h3>"
                               + "<p>Sign in with your Twitter account and start downloading data from Twitter</p>"
                           + "</div>"
                           + "<div class=\"col-md-6 to-animate-2\">"
                               + "<div class=\"call-to-action text-right\">"
                                   + "<a href=\"" + a + "\" class=\"sign-up\">Sign In With Twitter</a>"
                               + "</div>"
                           + "</div>"
                       + "</div>"
                   + "</div>"
               + "</div>");
            }
        %>
                                    
        <section id="fh5co-explore" data-section="explore">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 section-heading text-center">
                        <h2 class="to-animate">What is Data Ferret?</h2>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 subtext to-animate">
                                <h3>Ever been in the frustrating situation where you need to download a Twitter data and produce a report? Ever wanted all of those Tweets in front of you in Excel? Ever tried to copy tweets from Twitter into Excel? We have, and we know the frustration. We made Data Ferret to help you.</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <img src="" alt=""/>
            <div class="fh5co-explore">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-push-5 to-animate-2 tweet-table">
                                <%
                                    if(session.getAttribute("accessToken") != null)
                                    {
                                        List<Status> tweets = tweeter.getUserTimeline("@" + tweeter.getScreenName(), 50);
                                        String tableString = "<table class=\"demo\">"+
                                                "<thead class=\"demo\">" +
                                                    "<tr class=\"demo\">"+
                                                        "<th class=\"demo\">Tweeted Text</th>"+
                                                        "<th class=\"demo\">Tweeted Date</th>"+
                                                        "<th class=\"demo\">Retweet Count</th>"+
                                                        "<th class=\"demo\">Favourite Count</th>"+
                                                        "<th class=\"demo\">Link</th>"+
                                                        "<th class=\"demo\">User</th>"+
                                                    "</tr>";
                                                
                                        for(Status s : tweets)
                                        {
                                            tableString += "<tr class=\"demo\">"+
                                                    "<td class=\"demo\">" + s.getText() + "</td>"+
                                                    "<td class=\"demo\">" + s.getCreatedAt()+ "</td>"+
                                                    "<td class=\"demo\">" + s.getRetweetCount() + "</td>"+
                                                    "<td class=\"demo\">" + s.getFavoriteCount() + "</td>"+
                                                    "<td class=\"demo\"><a class=\"twitter\" href=\"https://twitter.com/" + s.getUser().getScreenName() + "/status/" + s.getId() + "\" target='_blank'><i class=\"icon-twitter\"></i>Tweet</a></td>"+
                                                    "<td class=\"demo\">" + s.getUser().getScreenName() + "</td>"+
                                                "</tr>";
                                            
                                        }
                                        tableString += "</table>";
                                        out.println(tableString);
                                    }
                                    else
                                    {
                                        out.println("<p><a class=\"twitter\" href=\"" + a + "\" class=\"sign-up\">Sign In With Twitter <i class=\"icon-twitter\"></i></a> to see your demo report!</p>");
                                        out.println("<img class=\"img-responsive\" src=\"images/DataFerretEg.png\" alt=\"Sample csv image\">");
                                    }
                                %>
                        </div>
                        <div class="col-md-4 col-md-pull-8 to-animate-2">
                            <div class="mt" style="margin-top: 10;">
                                <h3>Twitter timelines in an instant!</h3>
                                <p>Data Ferret lets you enter you choose how much you want to spend, just select your plan and use our secure payment portal to purchase the Twitter data that you need, safe easy and convenient with your download available in an Excel file</p>
                                <ul class="list-nav">
                                    <li><i class="icon-check2"></i>No more time wasted trying to copy and paste from Twitter into Excel</li>
                                    <li><i class="icon-check2"></i>Simply download the Twitter data and perform the analysis that you need</li>
                                    <li><i class="icon-check2"></i>Simple, fast and convenient.</li>
                                    <li><i class="icon-check2"></i>Secure</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <img src="" alt=""/>
            <div class="fh5co-explore fh5co-explore-bg-color">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-pull-1 to-animate-3">
                            <img class="img-responsive" src="images/canstockphoto15306760.jpg" alt="work"/>
                        </div>
                        <div class="col-md-4 to-animate-3">
                            <div class="mt">
                                <h3>How long does it take?</h3>
                                <div>                                   
                                    <p>As soon as your purchase has been approved, our servers quickly jump to work and starting retrieving the data you need directly from Twitter. As fresh and up to date as can be. Depending on the size of your requested data it is either ready to download straight away, or as soon as your data is ready we send you an e-mail to let you know your Excel spreadsheet has arrived and is ready for download.</p>
                                    
                                </div>
                                <div>                                    
                                    <p>One click of the download link and your data is on the way to you. No more difficult copying and pasting, toiling for hours to get your data.</p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="fh5co-faq" data-section="faq">
            <div class="fh5co-faq">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 section-heading text-center">
                            <h2 class="to-animate">Common Questions</h2>
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 subtext">
                                    <h3 class="to-animate">Everything you need to know before you get started</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-faq to-animate-2">
                                <h3>What is Data Ferret?</h3>
                                <p>Data Ferret came out of our own frustrations of trying to get data out of Twitter, we looked at complex programs and other frustrating ways of getting information out for the reporting we were required to do. If you suffer from the same frustration, we really hope that this helps with your needs in an easy, convenient and affordable manner.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>I have technical problem, who do I email? </h3>
                                <p>Oops, we have tried our best to cover all of the bases, but sometime something slips. Drop us a line at <a href="mailto: info@dataferret.co.za">info@dataferret.co.za</a> and let us know what the problem is, we will get one of our team members to help you sort the problem out.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>How do I use Data Ferret's features?</h3>
                                <p>We have tried to make the interface as easy to use as possible, simply select the plan you would like and enter your payment details. As soon as your plan is approved you simply enter the account details our search term you are interested in. Select the option on what sort of search you would like from an accounts timeline to it’s follower or following list. Depending on the Twitter rate limits or the size of the data your information will be ready for download straight away or we will send you a link to your data to download it when we receive it from Twitter.</p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="box-faq to-animate-2">
                                <h3>Can I select a username and password?</h3>
                                <p>We work with the Twitter O-Auth system, all you need is a Twitter account, when you click the link to sign in you will be taken to Twitter to validate that you are happy to use our system. Once you have accepted you may proceed with your download. No need to remember usernames or passwords, just use your Twitter account, that easy.</p>
                            </div>               
                        </div>
                        
                        <div class="col-md-6">
                            <div class="box-faq to-animate-2">
                                <h3>is Data Ferret free?</h3>
                                <p>You are able to download your own Twitter timeline if it is publicly available, just enter your Twitter ID in the search parameters and we will download your Twitter data into an MS Excel file for you. Free of charge.</p>
                            </div>               
                        </div>           
                        
                        <div class="col-md-6">
                            <div class="box-faq to-animate-2">
                                <h3>How do I access the advanced options on Data Ferret?</h3>
                                <p>If you would like to take advantage of Data Ferret's advanced options such as searching Twitter for hash tags, key words or Twitter IDs you can take advantage of our easy payment plans to get your data in an MS Excel file.</p>
                                <p>It is as simple as pay, request, and download.</p>
                            </div>               
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>

        <hr>

        
        <%
            if(session.getAttribute("accessToken") == null)
            {
                out.println("<div class=\"getting-started getting-started-1\">"
             + "<div class=\"container\">"
                + "<div class=\"row\">"
                    + "<div class=\"col-md-6 to-animate\">"
                        + "<h3>Get Started Here</h3>"
                        + "<p>Sign in with Data Ferret today and start downloading Twitter data as an MS Excel report</p>"
                    + "</div>"
                    + "<div class=\"col-md-6 to-animate-2\">"
                        + "<div class=\"call-to-action text-right\">"
                            + "<a href=\"" + a + "\" class=\"sign-up\">Sign In with Twitter</a>"
                        + "</div>"
                    + "</div>"
                + "</div>"
            + "</div>"
        + "</div>");
            }
        %>

        <div id="fh5co-footer" data-section="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 to-animate">
                        <h3 class="section-title">About Us</h3>
                        <p>Data Ferret lets you purchase Twitter Data in a secure, convenient and easy manner. The data is presented in an easy to use Excel format that assists you with meeting your reporting requirements.</p>
                        <p class="copy-right">&copy; 2016 Data Ferret. <br>All Rights Reserved. <br>
                            Designed by <a href="#" target="_blank">Spontaneous Ventures</a>            
                        </p>
                    </div>

                    <div class="col-md-6 to-animate">
                        <h3 class="section-title">Contact Us</h3>
                        <ul class="contact-info">                           
                            <li><a href="mailto: info@dataferret.co.za"><i class="icon-envelope"></i>info@dataferret.co.za</a></li>
                        </ul>
                        <h3 class="section-title">Connect with Us</h3>
                        <ul class="social-media">
                            <li><a href="https://www.facebook.com/DataFerret" class="facebook"><i class="icon-facebook"></i></a></li>
                            <li><a href="https://twitter.com/Ferret_Data" class="twitter"><i class="icon-twitter"></i></a></li>
                        </ul>
                    </div>                   
                </div>
            </div>
        </div>
        


        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Owl Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
        <script src="js/google_map.js"></script>
        <!-- Main JS (Do not remove) -->
        <script src="js/main.js"></script>

    </body>
</html>



