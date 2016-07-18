package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.Status;
import TwitterDownload.TwitterHandler;
import TwitterDownload.TwitterExel;
import java.io.*;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import jxl.*;
import jxl.write.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    TwitterHandler tweeter;
    private String a;
    private AccessToken accessToken = null;
    String pin;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');

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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n");
      out.write("<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n");
      out.write("<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n");
      out.write("<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <title>Data Ferret - Download Twitter Feeds</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"Website for downloading Twitter feeds as MS Excel documents\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Twitter feed downloads as MS Excel documents\" />\n");
      out.write("        <meta name=\"author\" content=\"Spontaneous D\" />\n");
      out.write("\n");
      out.write("       \n");
      out.write("        <!-- Facebook and Twitter integration -->\n");
      out.write("        <meta property=\"og:title\" content=\"\"/>\n");
      out.write("        <meta property=\"og:image\" content=\"\"/>\n");
      out.write("        <meta property=\"og:url\" content=\"\"/>\n");
      out.write("        <meta property=\"og:site_name\" content=\"\"/>\n");
      out.write("        <meta property=\"og:description\" content=\"\"/>\n");
      out.write("        <meta name=\"twitter:title\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:image\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:url\" content=\"\" />\n");
      out.write("        <meta name=\"twitter:card\" content=\"\" />\n");
      out.write("\n");
      out.write("        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n");
      out.write("        <link rel=\"shortcut icon\" href=\"favicon.ico\">\n");
      out.write("\n");
      out.write("        <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css'>\n");
      out.write("\n");
      out.write("        <!-- Animate.css -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animate.css\">\n");
      out.write("        <!-- Icomoon Icon Fonts-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/icomoon.css\">\n");
      out.write("        <!-- Simple Line Icons -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/simple-line-icons.css\">\n");
      out.write("        <!-- Bootstrap  -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("        <!-- Owl Carousel  -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/owl.theme.default.min.css\">\n");
      out.write("        <!-- Style -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Modernizr JS -->\n");
      out.write("        <script src=\"js/modernizr-2.6.2.min.js\"></script>\n");
      out.write("        <!-- FOR IE9 below -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("        <script src=\"js/respond.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header role=\"banner\" id=\"fh5co-header\">\n");
      out.write("            <div class=\"fluid-container\">\n");
      out.write("                <nav class=\"navbar navbar-default\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <!-- Mobile Toggle Menu Button -->\n");
      out.write("                        <a href=\"#\" class=\"js-fh5co-nav-toggle fh5co-nav-toggle\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\"><i></i></a>\n");
      out.write("                        \n");
      out.write("                        <a class=\"navbar-brand\" href=\"index.html\">\n");
      out.write("                            <img class=\"brand-slogan\" src=\"images/ferret.png\" alt=\"Data Ferret logo\"><span>D</span>ata Ferret\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"navbar\" class=\"navbar-collapse collapse\">\n");
      out.write("                        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                            <li><a href=\"#\" data-nav-section=\"home\"><span>Home</span></a></li>\n");
      out.write("                            <li><a href=\"#\" data-nav-section=\"pricing\"><span>Pricing</span></a></li>  \n");
      out.write("                            <li><a href=\"#\" data-nav-section=\"explore\"><span>Demo Report</span></a></li>                       \n");
      out.write("                            <li><a href=\"#\" data-nav-section=\"faq\"><span>FAQ</span></a></li>\n");
      out.write("                            <li><a href=\"#\" data-nav-section=\"footer\"><span>Contact Us</span></a></li>\n");
      out.write("                            \n");
      out.write("                            ");

                                if(tweeter.getAccessToken() == null)
                                {                                   
                                    out.println("<li class=\"call-to-action\"><a href=\"" + a + "\"><span><i class=\"icon-twitter\"></i>Login with Twitter</span></a></li>");
                                }
                                else
                                {
                                    out.println("<li><span><i class=\"icon-twitter\"></i>Welcome " + tweeter.getUserName() + "!</span></li>");
                                }
                            
      out.write("   \n");
      out.write("                            \n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("        <section id=\"fh5co-home\" data-section=\"home\" style=\"background-image: url(images/twitterdata.png);\" data-stellar-background-ratio=\"0.5\">\n");
      out.write("            <div class=\"gradient\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"text-wrap\">\n");
      out.write("                    <div class=\"text-inner\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <h1 class=\"to-animate\">Welcome To Data Ferret</h1>\n");
      out.write("                                <img src=\"images/ferret.png\" alt=\"\"/>\n");
      out.write("                                <h2 class=\"to-animate\">Easily Get Twitter Timelines in Excel</h2>                                        \n");
      out.write("                                <div class=\"call-to-action\">\n");
      out.write("                                    ");

                                        if(tweeter.getAccessToken() == null)
                                        {
                                            out.println("<a href=\"" + a + "\" class=\"demo to-animate\"><i class=\"icon-twitter\"></i>Sign Up with Twitter</a>");
                                        }
                                        else
                                        {
                                            out.println("<form class=\"contact-form\" action=\"download.jsp\"><fieldset><input id=\"twitterhandel\" class=\"form-control\" placeholder=\"Twitter Handel\" name=\"twiterhandel\" type=\"text\" /><p><input class=\"form-control\" id=\"submitform\" name=\"submitform\" type=\"submit\" value=\"Download Twitter Feed\" /></p></fieldset></form>");
                                            out.println("<a href=\"download.jsp\" class=\"download to-animate\">Download Your Twitter Feed</a>");
                                        }
                                    
      out.write("\n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("              \n");
      out.write("        </section>\n");
      out.write("                                    \n");
      out.write("        <section id=\"fh5co-pricing\" data-section=\"pricing\">\n");
      out.write("            <div class=\"fh5co-pricing\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-12 section-heading text-center\">\n");
      out.write("                            <h2 class=\"to-animate\">Select One of the Plans Below</h2>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-md-8 col-md-offset-2 subtext\">\n");
      out.write("                                    <h3 class=\"to-animate\">As soon as you have made your secure purchase via your PayPal account, Data Ferret gets to work on downloading your data. As soon as it is ready you are sent an e-mail notifying you that your download is ready.</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"pricing\">\n");
      out.write("                            <div class=\"col-md-3\">\n");
      out.write("                                <div class=\"price-box to-animate-2\">\n");
      out.write("                                    <h2 class=\"pricing-plan\">Starter</h2>\n");
      out.write("                                    <div class=\"price\"><sup class=\"currency\">$</sup>2.99<small>once-off</small><p>or</p> <sup class=\"currency\">$</sup>1.99<small>/month</small> </div>\n");
      out.write("                                    <ol>\n");
      out.write("                                        <li>No. of Tweets = 500</li>\n");
      out.write("                                        <li>Free Data = 50</li>\n");
      out.write("                                    </ol>\n");
      out.write("                                    <a href=\"#\" class=\"btn btn-select-plan btn-sm\">Select Plan</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            <div class=\"col-md-3\">\n");
      out.write("                                <div class=\"price-box to-animate-2\">\n");
      out.write("                                    <h2 class=\"pricing-plan\">Basic</h2>\n");
      out.write("                                    <div class=\"price\"><sup class=\"currency\">$</sup>3.99<small>once-off</small><p>or</p> <sup class=\"currency\">$</sup>2.99<small>/month</small> </div>\n");
      out.write("                                    <ol>\n");
      out.write("                                        <li>No. of Tweets = 1500</li>\n");
      out.write("                                        <li>Free Data = 50</li>\n");
      out.write("                                    </ol>\n");
      out.write("                                    <a href=\"#\" class=\"btn btn-select-plan btn-sm\">Select Plan</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"col-md-3\">\n");
      out.write("                                <div class=\"price-box to-animate-2\">\n");
      out.write("                                    <h2 class=\"pricing-plan\">Intermediate</h2>\n");
      out.write("                                    <div class=\"price\"><sup class=\"currency\">$</sup>4.99<small>once-off</small> <p>or</p><sup class=\"currency\">$</sup>3.99<small>/month</small> </div>\n");
      out.write("                                    <ol>\n");
      out.write("                                        <li>No. of Tweets = 2500</li>\n");
      out.write("                                        <li>Free Data = 50</li>\n");
      out.write("                                    </ol>\n");
      out.write("                                    <a href=\"#\" class=\"btn btn-select-plan btn-sm\">Select Plan</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            <div class=\"col-md-3\">\n");
      out.write("                                <div class=\"price-box to-animate-2\">\n");
      out.write("                                    <h2 class=\"pricing-plan\">Expert</h2>\n");
      out.write("                                    <div class=\"price\"><sup class=\"currency\">$</sup>5.99<small>once-off</small><p>or</p><sup class=\"currency\">$</sup>4.99<small>/month</small> </div>\n");
      out.write("                                    <ol>\n");
      out.write("                                        <li>No. of Tweets = 3500</li>\n");
      out.write("                                        <li>Free Data = 50</li>\n");
      out.write("                                    </ol>\n");
      out.write("                                    <a href=\"#\" class=\"btn btn-select-plan btn-sm\">Select Plan</a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                         \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-6 col-md-offset-3 to-animate\">\n");
      out.write("                            <p>Don't believe us? Give our FREE download a try to see how it works.<a href=\"#\">Free Demo Download</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("                   \n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("                                    \n");
      out.write("        <section id=\"fh5co-explore\" data-section=\"explore\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-12 section-heading text-center\">\n");
      out.write("                        <h2 class=\"to-animate\">What is Data Ferret?</h2>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-8 col-md-offset-2 subtext to-animate\">\n");
      out.write("                                <h3>Ever been in the frustrating situation where you need to download a Twitter timeline? Ever wanted all of those Tweets infront of you in Excel? Ever tried to copy tweets from Twitter into Excel? We have, and we know the frustration. We made Data Ferret to help you.</h3>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <img src=\"\" alt=\"\"/>\n");
      out.write("            <div class=\"fh5co-explore\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-8 col-md-push-5 to-animate-2\">\n");
      out.write("                            <img class=\"img-responsive\" src=\"images/DataFerretEg.png\" alt=\"Sample csv image\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 col-md-pull-8 to-animate-2\">\n");
      out.write("                            <div class=\"mt\">\n");
      out.write("                                <h3>Twitter timelines in an instant!</h3>\n");
      out.write("                                <p>Data Ferret lets you enter your credit card details and purchase a Twitter timeline, up to the last 3,200 tweets are pulled and placed into a CSV or Excel spreadsheet for you.</p>\n");
      out.write("                                <ul class=\"list-nav\">\n");
      out.write("                                    <li><i class=\"icon-check2\"></i>No more time wasted trying to copy and past from Twitter into Excel</li>\n");
      out.write("                                    <li><i class=\"icon-check2\"></i>Simply download the timeline and do the analysis that you need</li>\n");
      out.write("                                    <li><i class=\"icon-check2\"></i>Simple, fast and convenient.</li>\n");
      out.write("                                    <li><i class=\"icon-check2\"></i>Just what you need</li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <img src=\"\" alt=\"\"/>\n");
      out.write("            <div class=\"fh5co-explore fh5co-explore-bg-color\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-8 col-md-pull-1 to-animate-3\">\n");
      out.write("                            <img class=\"img-responsive\" src=\"images/clock.gif\" alt=\"work\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 to-animate-3\">\n");
      out.write("                            <div class=\"mt\">\n");
      out.write("                                <h3>How long does it take?</h3>\n");
      out.write("                                <div>\n");
      out.write("                                   \n");
      out.write("                                    <p>After you'r purchase has been approved, our servers quickly starting pull the data directly from Twitter. As fresh and up to date as can be. As soon as your data is ready we send you an e-mail to let you know your Excel spreadsheet has arrived.</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div>\n");
      out.write("                                    \n");
      out.write("                                    <p>One click of the download link and your data is on the way to you. No more difficult copying and pasting, toiling for hours to get your data.</p>\n");
      out.write("                                </div>\n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <section id=\"fh5co-faq\" data-section=\"faq\">\n");
      out.write("            <div class=\"fh5co-faq\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-12 section-heading text-center\">\n");
      out.write("                            <h2 class=\"to-animate\">Common Questions</h2>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-md-8 col-md-offset-2 subtext\">\n");
      out.write("                                    <h3 class=\"to-animate\">Everything you need to know before you get started</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>What is Data Ferret?</h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>I have technical problem, who do I email? </h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>How do I use Data Ferret features?</h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-6\">\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>What languages are available?</h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>Can I have a username that is already taken?</h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"box-faq to-animate-2\">\n");
      out.write("                                <h3>Is Data Ferret free?</h3>\n");
      out.write("                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <hr>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("\n");
      out.write("        <div id=\"fh5co-footer\" data-section=\"footer\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-6 to-animate\">\n");
      out.write("                        <h3 class=\"section-title\">About Us</h3>\n");
      out.write("                        <p>Data Ferret lets you enter your credit card details and purchase a Twitter timeline, up to the last 3,200 tweets are pulled and placed into a CSV or Excel spreadsheet for you.</p>\n");
      out.write("                        <p class=\"copy-right\">&copy; 2015 Data Ferret. <br>All Rights Reserved. <br>\n");
      out.write("                            Designed by <a href=\"http://spondev.co.za/\" target=\"_blank\">Spontaneous Disruption</a>            \n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-6 to-animate\">\n");
      out.write("                        <h3 class=\"section-title\">Contact Us</h3>\n");
      out.write("                        <ul class=\"contact-info\">\n");
      out.write("                            <li><i class=\"icon-map-marker\"></i>193 Bryanston Drive, Johannesburg, 2194</li>\n");
      out.write("                            <li><i class=\"icon-phone\"></i>+ 27 XX XXX XXXX</li>\n");
      out.write("                            <li><i class=\"icon-envelope\"></i><a href=\"#\">info@domain.com</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        <h3 class=\"section-title\">Connect with Us</h3>\n");
      out.write("                        <ul class=\"social-media\">\n");
      out.write("                            <li><a href=\"#\" class=\"facebook\"><i class=\"icon-facebook\"></i></a></li>\n");
      out.write("                            <li><a href=\"#\" class=\"twitter\"><i class=\"icon-twitter\"></i></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>                   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- jQuery -->\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <!-- jQuery Easing -->\n");
      out.write("        <script src=\"js/jquery.easing.1.3.js\"></script>\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- Waypoints -->\n");
      out.write("        <script src=\"js/jquery.waypoints.min.js\"></script>\n");
      out.write("        <!-- Stellar Parallax -->\n");
      out.write("        <script src=\"js/jquery.stellar.min.js\"></script>\n");
      out.write("        <!-- Owl Carousel -->\n");
      out.write("        <script src=\"js/owl.carousel.min.js\"></script>\n");
      out.write("        <!-- Google Map -->\n");
      out.write("        <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false\"></script>\n");
      out.write("        <script src=\"js/google_map.js\"></script>\n");
      out.write("        <!-- Main JS (Do not remove) -->\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
