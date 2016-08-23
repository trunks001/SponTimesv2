///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package TwitterDownload;
//
//import java.io.InputStream;
//import java.util.ArrayList;
//import java.util.Enumeration;
//import java.util.List;
//import org.apache.commons.httpclient.HttpClient;
//import org.apache.commons.httpclient.HttpStatus;
//import org.apache.commons.httpclient.methods.PostMethod;
//import org.apache.commons.httpclient.NameValuePair;
//import org.apache.commons.httpclient.HttpException;
//
///**
// *
// * @author dvt
// */
//public class PaymentHandler {
//    private String merchantId = "10277262";
//    private String merchantKey = "061n75263zg71";
//    private String returnUrl = ""; //Downloads page?
//    private String cancelUrl = "www.dataferret.co.za/index.jsp"; //TODO ?logged=1?
//    private String name = "";
//    private String surname = "";
//    private String email = "";
//    private String paymentId = "";
//    private double amount = 0.00; //This has to be in ZAR, so we should do some exchange-rate stuff here
//    private String itemName = "";
//    private String itemDescription = "";
//    
//    private static final String PAYFAST_VALIDATE_URL_TEST = "https://sandbox.payfast.co.za/eng/query/validate";
//
//// In processRequest method of Servlet
//    PaymentHandler() {
//        Enumeration en = request.getParameterNames();
//        List nvps = new ArrayList ();
//        while (en.hasMoreElements()) {
//             String parm = en.nextElement();
//             String value = request.getParameter(parm);
//             if (!parm.equals("signature"))
//                 nvps.add(new NameValuePair(parm, value));
//        }
//        valid = isValidateData(PAYFAST_VALIDATE_URL_TEST, nvps);
//    }
// 
// 
// 
//// validateData method
// 
//    /*
//     * Data Sent back to PayFast and validated against their site
//     *
//     * @param site Validation site
//     * @param list parameter list (minus signature)
//     * @return true implies valid
//     */
//    private boolean isValidateData(String site,List list) {
//         HttpClient httpclient = HttpClients.createDefault();
//        HttpPost httppost = new HttpPost("http://www.a-domain.com/foo/");
//
//        // Request parameters and other properties.
//        List<NameValuePair> params = new ArrayList<NameValuePair>(2);
//        params.add(new BasicNameValuePair("param-1", "12345"));
//        params.add(new BasicNameValuePair("param-2", "Hello!"));
//        httppost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
//
//        //Execute and get the response.
//        HttpResponse response = httpclient.execute(httppost);
//        HttpEntity entity = response.getEntity();
//
//        if (entity != null) {
//            InputStream instream = entity.getContent();
//            try {
//                // do something useful
//            } finally {
//                instream.close();
//            }
//        }
//    }
//    
//}