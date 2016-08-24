package TwitterDownload;

/**
 *
 * @author Paul Cloete
 */
public class PaymentHandler {
    private String merchantId = "10277262";
    private String merchantKey = "061n75263zg71";
    private String returnUrl = ""; //Downloads page?
    private String cancelUrl = "www.dataferret.co.za/index.jsp"; //TODO ?logged=1?
    private String name = "";
    private String surname = "";
    private String email = "";
    private String paymentId = "";
    private double amount = 0.00; //This has to be in ZAR, so we should do some exchange-rate stuff here
    private String itemName = "";
    private String itemDescription = "";
    
    private static String PAYFAST_URL = "https://www.payfast.co.za/eng/process";
    private static String PAYFAST_SANDBOX_URL = "https://sandbox.payfast.co.za";

    // In processRequest method of Servlet
    PaymentHandler(String name, String surname, String email, double amount, 
            String itemName, String itemDescription) {
        String payFastUrl = PAYFAST_URL + "?mechant_id=" + this.merchantId + 
                "&merchant_key=" + this.merchantKey + 
                "&returl_url=" + getReturnUrl() +   //TODO complete this
                "&cancel_url=" + "" +               //TODO generate this URL
                "&name_first=" + name +
                "&name_last=" + surname +
                "&email_address=" + email +
                "$m_payment_id=" + this.getPaymentId() +
                "&amount=" + amount +
                "&item_name=" + itemName +
                "&item_description=" + itemDescription;
    }   
    
    private String getReturnUrl() {
        //TODO generate a unique payment 'key' and send it back as a request 
        //param (eg returnUrl?uniquePaymentKey=i_am_unique)
        //Strategy will be:
        //1) generate a hash based on firstName, lastName, emailAddress etc.
        //2a) Query db and see if the hash already exists for some previous purchase
        //2b) If it exists, change the hash in some way
        //2c) Repeat steps 2a & 2b until a unique hash is created
        //3) Store this hash to the db along with the product the user is purchasing
        return "retunrUrl";
    }
    
    private String getPaymentId() {
        //TODO get/generate paymentId
        return "paymentId";    
    }
    
      
}