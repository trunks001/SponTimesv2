<%-- 
    Document   : index.jsp
    Created on : Mar 25, 2016, 12:28:19 PM
    Author     : trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
String[] list;

private void fulllist()
{
    list = new String[9];
    list[0] = "<p><strong>Hello</strong> thisd is a relkadgfkjsfljgnbsadolfjbadifhsadikhblndadjadhdfnaidhiksfoadjfosaikdjpifhfafiushiuah    ioadhjfosaujfdhgasidhgfpi aishfdd owrighoisafjhgsdofighpasfu a</p>";
    list[1] = "<p>Happy days oh happy days!!!! bjbj9jh8fhui98ghu87thyi9oguhf78hi98h7ygt789o0kpj-0h9ih8 k,obkmv mk b,l b,mkl ,kl ,k m,kl ,l ,l ;l , nm.;[pkjho9gu8thyi9gyuutyuho0hgi8gu8tuhjo9gh</p> <img class=\"img-responsive img-circle\" src=\"img/Spontaneous Times Logo-HR.png\"/>";
    list[2] = "Isfjsewjfejkfdglfdgljgkldfjkglfdjgkldfjgkldfjglfdjkglfdjkgldfjgkldgjkdlkredgkdlgdl";
    list[3] = "A";
    list[4] = "Test";
    list[5] = "Dide";
    list[6] = "It";
    list[7] = "Work";
    list[8] = "?????";
}
%>
<%
fulllist();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                     String html = "";
                     int i = 0;

                     for (String s : list) 
                     {
                      html += "<div class=\"col-lg-4\" style=\"overflow:hidden; height:250px\"><h3>Header</h3>";
                      html += s;
                      html += "</div>";
                      i++;
                     }


                     out.print(html);

                    %>
                </div>
            </div>
        </div>
    </body>
</html>
