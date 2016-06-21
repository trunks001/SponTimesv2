<%-- 
    Document   : about.jsp
    Created on : 08 Jul 2015, 1:30:56 PM
    Author     : Bradley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String pin;
%>
<%
    pin = request.getParameter("oauth_verifier");
%>

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
<div class="wrapper col2">    
  <div id="gallery">
    <ul>
      <li class="placeholder" style="background-image:url(images/demo/ferret_home.gif);">Image Holder</li>
      <li><a class="swap" style="background-image:url(images/demo/290x105.gif);" href="#gallery"><strong>Services</strong><span><img src="images/demo/gallery_1.gif" alt="" /></span></a></li>
      <li><a class="swap" style="background-image:url(images/demo/290x105.gif);" href="#gallery"><strong>Products</strong><span><img src="images/demo/gallery_2.gif" alt="" /></span></a></li>
      <li class="last"><a class="swap" style="background-image:url(images/demo/290x105.gif);" href="#gallery"><strong>Company</strong><span><img src="images/demo/gallery_3.gif" alt="" /></span></a></li>
    </ul>
    <div class="clear"></div>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <div id="content">
      <h1>What is Data Ferret?</h1>
	<p>Every been in the frustrating situation where you need to download a Twitter timeline? Ever wanted all of those Tweets infront of you in Excel? Ever Tried to copy tweets from Twitter into Excel? We have, it sux. We made Data Ferret to help you.</p>
<p>Data Ferret a Tweets lets you enter your credit card details and purchase a Twitter timeline, up to the last 3,200 tweets are pulled and placed into a CSV or Excel spreadsheet for you.</p>
<p>No more time wasted trying to copy and past from Twitter into Excel, it is all done for you. Simply download the timeline and do the analysis that you need.</P
<p>Simple, fast and convenient. Just what you need</p>
<p>As soon as you have made your secure purchase via your PayPal account, Data Ferret gets to work on downloading your data. As soon as it is ready you are sent an e-mail notifying you that your download is ready..</p>
<p>Don't believe us? Give our FREE download a try to see how it works.</p>
      <div class="homecontent">
        <ul>
          <li>
            <p class="imgholder"><img src="images/demo/DataFerretEgSmall.jpg" alt="" /></p>
            <h2>What do I get?</h2>
            <p>Wondering what the data looks like that you get back in Excel from Twitter? Click on the link below to see an example</p>
            <p class="Example"><a href="images/demo/DataFerretEg.png">Example &raquo;</a></p>
          </li>
          <li class="last">
            <p class="imgholder"><img src="images/demo/clock.gif" alt="" /></p>
            <h2>How Long Does it Take?</h2>
            <p>After you'r purchase has been approved, our servers quickly starting pull the data directly from Twitter. As fresh and up to date as can be. As soon as your data is ready we send you an e-mail to let you know your Excel spreadsheet has arrived.</p>
<p>One click of the download link and your data is on the way to you. No more difficult copying and pasting, toiling for hours to get your data. 
          </li>
        </ul>
        <div class="clear"></div>
      </div>
    </div>
    <div id="column">
      <div id="featured">
        <ul>
          <li>
            <h2>Need to be freed?</h2>
            <p class="imgholder"><img src="images/demo/240x90.jpg" alt="" /></p>
            <p>Ever feel trapped or constrained because you cannot get a Twitter feed into Excel? Not to worry Data Ferret is here to help. Select the users timeline that you want to download and we will do the work for you. Go on, give our service a try</p>
            <p class="more"><a href="#">Read More &raquo;</a></p>
          </li>
        </ul>
      </div>
      <div class="holder">
        <div class="imgholder"><img src="images/demo/290x100.gif" alt="" /></div>
        <p>Nullamlacus dui ipsum conseque loborttis non euisque morbi penas dapibulum orna.</p>
        <p class="readmore"><a href="#">Read More &raquo;</a></p>
      </div>
    </div>
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
