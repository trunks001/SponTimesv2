<%-- 
    Document   : register
    Created on : Apr 2, 2016, 1:22:34 AM
    Author     : trunks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Spon_Times_NavBar.jsp"  %>
        <%@page import="java.util.*" %>
        
        <!-- Register Form Section -->
    <section id="Login" class="container content-section text-center">
           
        <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <h1>Register</h1>

                                     
                        <form role="UserRegistration" class="">
                            <div class="form-group">
                                <p>Enter your Username</p>
                                <input type="text" placeholder="Username" class="form-control">
                                <br>
                                <p>Enter your password</p> 
                                <input type="text" placeholder="Password" class="form-control">
                                <br>
                                <p>Confirm your password</p>
                                <input type="text" placeholder="Confirm Password" class="form-control">
                                <br>
                                <p>Enter your email address</p>
                                <input type="text" placeholder="Email Address" class="form-control">  
                                <a href="#"><button type="submit" class="btn btn-default btn-lg" >Register</button> </a>                
                            </div>
                        </form>    
                </div>
        </div>     
    </section>
    </body>
</html>
