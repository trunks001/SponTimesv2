<%-- 
    Document   : index
    Created on : 13 Jul 2016, 5:57:26 PM
    Author     : Bones
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
<%@page import="TwitterDownload.TwitterExel" %>
<%@page import="java.io.*" %>
<%@page import="java.io.File" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="jxl.*" %>
<%@page import="jxl.write.*" %>

<%!
    TwitterHandler tweeter;
    private String a;
    private AccessToken accessToken = null;
    String pin;
%>

<%
    String str = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/index.jsp";
    
    tweeter = (TwitterHandler)session.getAttribute("tweeter");
    
    if(tweeter == null)
    {
        tweeter = new TwitterHandler(str);
        session.setAttribute("tweeter", tweeter);
    }
    
    pin = request.getParameter("oauth_verifier");
    if(pin != null  && !pin.equals("null"))
        tweeter.getAccessToken(pin);
    
    String a = tweeter.getRequestToken().getAuthorizationURL();
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Data Ferret - Download Twitter Feeds</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Website for downloading Twitter feeds as MS Excel documents" />
        <meta name="keywords" content="Twitter feed downloads as MS Excel documents" />
        <meta name="author" content="Spontaneous D" />

       
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
                        
                        <a class="navbar-brand" href="index.html">
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
                                if(tweeter.getAccessToken() == null)
                                {                                   
                                    out.println("<li class=\"call-to-action\"><a href=\"" + a + "\"><span><i class=\"icon-twitter\"></i>Login with Twitter</span></a></li>");
                                }
                                else
                                {
                                    out.println("<li><span><i class=\"icon-twitter\"></i>Welcome " + tweeter.getUserName() + "!</span></li>");
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
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="to-animate">Welcome To Data Ferret</h1>
                                <img src="images/ferret.png" alt=""/>
                                <h2 class="to-animate">Easily Get Twitter Timelines in Excel</h2>                                        
                                <div class="call-to-action">
                                    <%
                                        if(tweeter.getAccessToken() == null)
                                        {
                                            out.println("<a href=\"" + a + "\" class=\"demo to-animate\"><i class=\"icon-twitter\"></i>Sign Up with Twitter</a>");
                                        }
                                        else
                                        {
                                            out.println("<form class=\"contact-form\" action=\"download.jsp\"><fieldset><input id=\"twitterhandel\" class=\"form-control\" placeholder=\"Twitter Handel\" name=\"twiterhandel\" type=\"text\" /><p><input class=\"form-control\" id=\"submitform\" name=\"submitform\" type=\"submit\" value=\"Download Twitter Feed\" /></p></fieldset></form>");
                                            out.println("<a href=\"download.jsp\" class=\"download to-animate\">Download Your Twitter Feed</a>");
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
                            <div class="col-md-3">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Starter</h2>
                                    <div class="price"><sup class="currency">$</sup>2.99<small>once-off</small><p>or</p> <sup class="currency">$</sup>1.99<small>/month</small> </div>
                                    <ol>
                                        <li>No. of Tweets = 500</li>
                                        <li>Free Data = 50</li>
                                    </ol>
                                    <a href="#" class="btn btn-select-plan btn-sm">Select Plan</a>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Basic</h2>
                                    <div class="price"><sup class="currency">$</sup>3.99<small>once-off</small><p>or</p> <sup class="currency">$</sup>2.99<small>/month</small> </div>
                                    <ol>
                                        <li>No. of Tweets = 1500</li>
                                        <li>Free Data = 50</li>
                                    </ol>
                                    <a href="#" class="btn btn-select-plan btn-sm">Select Plan</a>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Intermediate</h2>
                                    <div class="price"><sup class="currency">$</sup>4.99<small>once-off</small> <p>or</p><sup class="currency">$</sup>3.99<small>/month</small> </div>
                                    <ol>
                                        <li>No. of Tweets = 2500</li>
                                        <li>Free Data = 50</li>
                                    </ol>
                                    <a href="#" class="btn btn-select-plan btn-sm">Select Plan</a>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="price-box to-animate-2">
                                    <h2 class="pricing-plan">Expert</h2>
                                    <div class="price"><sup class="currency">$</sup>5.99<small>once-off</small><p>or</p><sup class="currency">$</sup>4.99<small>/month</small> </div>
                                    <ol>
                                        <li>No. of Tweets = 3500</li>
                                        <li>Free Data = 50</li>
                                    </ol>
                                    <a href="#" class="btn btn-select-plan btn-sm">Select Plan</a>
                                </div>
                            </div>                         
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 to-animate">
                            <p>Don't believe us? Give our FREE download a try to see how it works.<a href="#">Free Demo Download</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </section>
                   
        <%
            if(tweeter.getAccessToken() == null)
            {
                out.println("<div class=\"getting-started getting-started-1\">"
             + "<div class=\"container\">"
                + "<div class=\"row\">"
                    + "<div class=\"col-md-6 to-animate\">"
                        + "<h3>Get Started Here</h3>"
                        + "<p>Sign up with Data Ferret today and start downloading Tweets</p>"
                    + "</div>"
                    + "<div class=\"col-md-6 to-animate-2\">"
                        + "<div class=\"call-to-action text-right\">"
                            + "<a href=\"" + a + "\" class=\"sign-up\">Sign Up For Free</a>"
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
                                <h3>Ever been in the frustrating situation where you need to download a Twitter timeline? Ever wanted all of those Tweets infront of you in Excel? Ever tried to copy tweets from Twitter into Excel? We have, and we know the frustration. We made Data Ferret to help you.</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <img src="" alt=""/>
            <div class="fh5co-explore">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-push-5 to-animate-2">
                            <img class="img-responsive" src="images/DataFerretEg.png" alt="Sample csv image">
                        </div>
                        <div class="col-md-4 col-md-pull-8 to-animate-2">
                            <div class="mt">
                                <h3>Twitter timelines in an instant!</h3>
                                <p>Data Ferret lets you enter your credit card details and purchase a Twitter timeline, up to the last 3,200 tweets are pulled and placed into a CSV or Excel spreadsheet for you.</p>
                                <ul class="list-nav">
                                    <li><i class="icon-check2"></i>No more time wasted trying to copy and past from Twitter into Excel</li>
                                    <li><i class="icon-check2"></i>Simply download the timeline and do the analysis that you need</li>
                                    <li><i class="icon-check2"></i>Simple, fast and convenient.</li>
                                    <li><i class="icon-check2"></i>Just what you need</li>
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
                            <img class="img-responsive" src="images/clock.gif" alt="work"/>
                        </div>
                        <div class="col-md-4 to-animate-3">
                            <div class="mt">
                                <h3>How long does it take?</h3>
                                <div>
                                   
                                    <p>After you'r purchase has been approved, our servers quickly starting pull the data directly from Twitter. As fresh and up to date as can be. As soon as your data is ready we send you an e-mail to let you know your Excel spreadsheet has arrived.</p>
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
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>I have technical problem, who do I email? </h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>How do I use Data Ferret features?</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="box-faq to-animate-2">
                                <h3>What languages are available?</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>Can I have a username that is already taken?</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                            <div class="box-faq to-animate-2">
                                <h3>Is Data Ferret free?</h3>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr>

        
        <%
            if(tweeter.getAccessToken() == null)
            {
                out.println("<div class=\"getting-started getting-started-1\">"
             + "<div class=\"container\">"
                + "<div class=\"row\">"
                    + "<div class=\"col-md-6 to-animate\">"
                        + "<h3>Get Started Here</h3>"
                        + "<p>Sign up with Data Ferret today and start downloading Tweets</p>"
                    + "</div>"
                    + "<div class=\"col-md-6 to-animate-2\">"
                        + "<div class=\"call-to-action text-right\">"
                            + "<a href=\"" + a + "\" class=\"sign-up\">Sign Up For Free</a>"
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
                        <p>Data Ferret lets you enter your credit card details and purchase a Twitter timeline, up to the last 3,200 tweets are pulled and placed into a CSV or Excel spreadsheet for you.</p>
                        <p class="copy-right">&copy; 2015 Data Ferret. <br>All Rights Reserved. <br>
                            Designed by <a href="http://spondev.co.za/" target="_blank">Spontaneous Disruption</a>            
                        </p>
                    </div>

                    <div class="col-md-6 to-animate">
                        <h3 class="section-title">Contact Us</h3>
                        <ul class="contact-info">
                            <li><i class="icon-map-marker"></i>193 Bryanston Drive, Johannesburg, 2194</li>
                            <li><i class="icon-phone"></i>+ 27 XX XXX XXXX</li>
                            <li><i class="icon-envelope"></i><a href="#">info@domain.com</a></li>
                        </ul>
                        <h3 class="section-title">Connect with Us</h3>
                        <ul class="social-media">
                            <li><a href="#" class="facebook"><i class="icon-facebook"></i></a></li>
                            <li><a href="#" class="twitter"><i class="icon-twitter"></i></a></li>
                        </ul>
                    </div>                   
                </div>
            </div>
            <p style="float: right">version 0.4</p>
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


