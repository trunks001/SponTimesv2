<%-- 
    Document   : report
    Created on : 17 Aug 2015, 1:07:12 PM
    Author     : Bradley
--%>

<%@page import="TwitterDownload.TwitterHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String pin;
%>
<%
    pin = request.getParameter("oauth_verifier");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Data Ferret</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" type="text/css" href="styles/layout.css">
    </head>
    <body id="top">
    <jsp:include page="headerPanel.jsp">
        <jsp:param name="verifier" value="<%= pin %>" />
    </jsp:include>
    <div class="wrapper col4">
      <div id="container">
        <div id="content">
          <h1>
              <%
                    String type = request.getParameter("type");
                    if(type != null)
                    {
                        if(type.equals("0"))
                        {
                            out.print("FREE Report");
                            session.setAttribute("ReportType", 0);
                        }
                        else if(type.equals("1"))
                        {
                            out.print("Once Off Report");
                            session.setAttribute("ReportType", 1);
                        }
                        else if(type.equals("2"))
                        {
                            session.setAttribute("ReportType", 2);
                            out.print("Subscribers Home");
                        }
                    }
              %>
          </h1>
          
            <% 
                String lit = "";
                String a = TwitterHandler.getInstance().getRequestToken().getAuthorizationURL();

                if(TwitterHandler.getInstance().getAccessToken() != null)
                    lit = "<p>Fill in the detail of the Twitter timeline or a Search Phrase you wish to export to Excel and get the last 50 tweets for FREE</p><form action=\"download.jsp\"><fieldset><legend>Input Form</legend><label for=\"Handel\">Twitter Handel<input id=\"twitterhandel\" name=\"twiterhandel\" type=\"text\" value=\"amstelSA\" /></label><p><input id=\"submitform\" name=\"submitform\" type=\"submit\" value=\"Submit\" />&nbsp;<input id=\"resetform\" name=\"resetform\" type=\"reset\" value=\"Reset\" /></p></fieldset></form>";
                else
                    lit = "<p>Please Login to Download your report</p><a href=\""+ a +"\"><button>Login</button></a>";
                out.print(lit);
            %>
          
          <h2>Pricing</h2>
          <table summary="Summary Here" cellpadding="0" cellspacing="0">
            <thead>
              <tr>
                <th>Volume of Tweets</th>
                <th>Free Data</th>
                <th>Once Off</th>
                <th>Subscription</th>
              </tr>
            </thead>
            <tbody>
              <tr class="light">
                <td>500</td>
                <td>Limited to 50</td>
                <td>&euro;2.99</td>
                <td>&euro;1.99</td>
              </tr>
              <tr class="dark">
                <td>1500</td>
                <td>Limited to 50</td>
                <td>&euro;3.99</td>
                <td>&euro;2.99</td>
              </tr>
              <tr class="light">
                <td>2500</td>
                <td>Limited to 50</td>
                <td>&euro;4.99</td>
                <td>&euro;3.99</td>
              </tr>
              <tr class="dark">
                <td>3500</td>
                <td>Limited to 50</td>
                <td>&euro;5.99</td>
                <td>&euro;4.99</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div id="column">
          <div id="featured">
            <ul>
              <li>
                <h2>Consider a Subscription</h2>
                <p class="imgholder"><img src="images/demo/free.png" alt="" /></p>
                <p>Want to see how our service works, go ahead and download the last fifty mentions from a timeline on this page. Once you know how it works, you can subscribe or just pay for up to 3,500 tweets from a timelime</p>
                <p class="more"><a href="#">Click Here to Subscribe&raquo;</a></p>
              </li>
            </ul>
          </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="clear"></div>
      </div>
    </div>
    <div class="wrapper col5">
      <div id="footer">
        <!-- End Contact Form -->
        <div id="compdetails">
          <div id="officialdetails">
            <h2>Company Information !</h2>
            <ul>
              <li>Data Ferret</li>
              <li>Johannesburg South Africa</li>
              <li>Company No. Still to Come</li>
              <li class="last">VAT No. Still to Come</li>
            </ul>
          </div>
          <div id="contactdetails">
            <a name="contact"></a>
            <h2>Our Contact Details !</h2>
            <ul>
              <li>Data Ferret</li>
              <li>193 Bryanston Drive</li>
              <li>Johannesburg</li>
              <li>2194</li>
              <li>Tel: Number to be acquired</li>
              <li>Fax: Number to be acquired</li>
              <li>Email: info@domain.com</li>
              <li class="last">LinkedIn: <a href="#">Company Profile</a></li>
            </ul>
          </div>
          <div class="clear"></div>
        </div>
        <!-- End Company Details -->
        <div id="copyright">
          <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">Data Ferret</a></p>
          <p class="fl_right">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
          <br class="clear" />
        </div>
        <div class="clear"></div>
      </div>
    </div>
    </body>
</html>
