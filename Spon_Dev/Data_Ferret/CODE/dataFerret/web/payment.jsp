<%-- 
    Document   : payment
    Created on : Aug 27, 2016, 2:37:50 PM
    Author     : paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String searchPhrase = request.getParameter("custom_str1");
    String searchType = request.getParameter("custom_str2");
    String numberOfTweets = request.getParameter("custom_str3");
    String productId = request.getParameter("custom_str4");
    
    String payfastUrl = request.getParameter("payfast_url");
    String merchantId = request.getParameter("merchant_id");
    String merchantKey = request.getParameter("merchant_key");
    String returnUrl = request.getParameter("return_url");
    String cancelUrl = request.getParameter("cancel_url");
    String amount = request.getParameter("amount");
    String itemName = request.getParameter("item_name");
    
    session.setAttribute("search_type", searchType);
    session.setAttribute("search_phrase", searchPhrase);
    session.setAttribute("page_size", numberOfTweets);
    session.setAttribute("productId", productId);
    session.setAttribute("priceZAR", amount);
    
    if(amount.equals("0")){
        response.sendRedirect("download.jsp");
    }
    else{
        response.sendRedirect(payfastUrl + 
                "?merchant_id=" + merchantId + 
                "&merchant_key=" + merchantKey +
                "&return_url=" + returnUrl +
                "&cancel_url=" + cancelUrl +
                "&amount=" + amount +
                "&item_name=" + itemName);
    }
%>