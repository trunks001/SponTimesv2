package TwitterDownload;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Bones
 */
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Scanner;
import jxl.write.DateTime;
import java.util.Date;

public class DataMethods {
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DEFAULT_DB_URL = "41.185.26.152";
    static final String DEFAULT_DB_NAME = "dataferret";
    static final String DEFAULT_DB_USERNAME = "checkers";
    static final String DEFAULT_DB_PASSWORD = "Trunkswilltry001!";
    
    public static Statement getDefaultConnection() throws SQLException, ClassNotFoundException, IOException{
       return getConnection(DEFAULT_DB_URL, DEFAULT_DB_NAME, DEFAULT_DB_USERNAME, DEFAULT_DB_PASSWORD);
    }
    
    public static Statement getConnection(String dbUrl, String dbName, String dbUsername, String dbPassword) throws SQLException, ClassNotFoundException, IOException{
        if(dbUrl == null || dbUrl.length() == 0) {
            dbUrl = DEFAULT_DB_URL;
        }
        
        if(dbName == null || dbName.length() == 0) {
            dbName = DEFAULT_DB_NAME;
        }
        
        if(dbUsername == null || dbUsername.length() == 0) {
            dbUsername = DEFAULT_DB_USERNAME;
        }
        
        if(dbPassword == null || dbPassword.length() == 0) {
            dbPassword = DEFAULT_DB_PASSWORD;
        }
        
//        String path = "/settings/dataferret.config";
//        
//        File test = new File(path);
//        String testPath = test.getAbsolutePath();
//        
//        Scanner scanner = new Scanner(new File(path));
//        while(scanner.hasNext()) {
//            String line = scanner.nextLine();
//            int index = line.indexOf(":");
//            String key = line.substring(0, index).trim();
//            String value = line.substring(index + 1, line.length()).trim();
//            
//            switch(key) {
//                case "databaseURL": 
//                    DB_URL = value;
//                    if(DB_URL.charAt(DB_URL.length() - 1) != '/') {
//                        DB_URL += "/";
//                    }
//                    break;
//                case "databaseName":
//                    DB_Name = value;
//                    break;
//                case "databaseUsername":
//                    DB_Username = value;
//                    break;
//                case "databasePassword":
//                    DB_Password = value;
//                    break;
//            }
//        }
//        scanner.close();
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://" + dbUrl + " :3306/" + dbName, dbUsername, dbPassword);
        Statement stmt = conn.createStatement();
        return  stmt;
    }
    
    public static ResultSet getUser(String userId) {
       try {
        ResultSet res = getData("SELECT * FROM Users WHERE userId = '" + userId + "'");
        
        return res;
       } catch(Exception ex) {
           logError(ex);
           return null;
       }
    }
    
    public static int saveUser(long twitterId, String screenName, String userName) {
        ResultSet result = null;
        try
        {      
        int ret = -1;
        
        result = getData("SELECT userId FROM Users WHERE twitterId = " + twitterId);
        if(result == null || !result.next())
        {    
            runQuery("INSERT INTO Users (screenName, twitterId, userName) VALUES ('" + screenName + "', " + twitterId + ", '" + userName + "')");
            result = getData("SELECT userId FROM Users WHERE twitterId = '" + twitterId + "'");

            if(result.next())
                ret = result.getInt("userId");
        }
        else
            ret = result.getInt("userId");
        
        result.close();
        return ret;
        }
        catch(Exception ex)
        {
            logError(ex);
            return -1;
        }
    }
     
    public static void saveLogin(int userId, String ipAddress) {
        try {
            runQuery("INSERT INTO Logins (userId, ipAddress) VALUES ('" + userId + "', '" + ipAddress + "')");
        } catch(Exception ex) {
            logError(ex);
        }
        
    }
    
    public static void saveDownload(int userId, String filePath, String productId, Double price) {
        ResultSet res;
        try
        {
            Double.parseDouble(filePath);
            res = getData("SELECT MAX(loginId) FROM Logins WHERE userId = " + userId);
            res.next();
            
            int loginId = res.getInt("MAX(loginId)");
        
            runQuery("INSERT INTO Downloads (userId, loginId, product, filePath, paidZAR) VALUES ('" + userId + "', " + loginId +"," + productId + ", '" + filePath + "', " + price + ")");
            res.close();
        }
        catch(Exception ex)
        {
            logError(ex);
        }
    }
    
    public static ResultSet getData(String sql) {
        try {
            Statement stmt = getDefaultConnection(); 

            ResultSet res = stmt.executeQuery(sql);
            
            stmt.closeOnCompletion();

            return res;
        } catch(Exception ex) {
            logError(ex);
            return null;
        }
    }
    
    public static ResultSet getDebugData(String sql, String dbUrl, String dbName, String dbUsername, String dbPassword) throws IOException, SQLException, ClassNotFoundException {

        Statement stmt = getConnection(dbUrl, dbName, dbUsername, dbPassword);

        ResultSet res = stmt.executeQuery(sql);

        stmt.closeOnCompletion();

        return res;
    }
    
    public static String getProducts() {
        try {
            Statement stmt = getDefaultConnection(); 

            ResultSet res = stmt.executeQuery("SELECT * FROM dataferret.Products WHERE active = 1 ORDER BY priceDollars;");
            
            String prods = "[";            
            
            while(res.next()){
                prods += "{$id$:" + res.getInt("productId") + ", $name$: $" + res.getString("name") + "$, $price$: " + res.getDouble("priceDollars") + ", $noOfTweets$: " + res.getInt("ammountOfData") + "},";
            }
            
            prods = prods.substring(0, prods.length() - 1);
            
            prods += "]";
            
            
            res.close();
            stmt.close();

            return prods;
        } catch(Exception ex) {
            logError(ex);
            return null;
        }
    }
    
    public static void runQuery(String sql) {
        try {
            Statement stmt = getDefaultConnection(); 

            stmt.execute(sql);

            stmt.closeOnCompletion();
        } catch(Exception ex) {
            logError(ex);
        }
    }
    
     public static void logError(Exception ex) {
        try {
            String path  = "/log";
            
            File dir = new File(path);
            
            if(!dir.exists())
                dir.mkdir();
            
            path = path + "/dataferret_error.log";
            
            File file  = new File(path);
            
            if(!file.exists())
                file.createNewFile();
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
                    
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            ex.printStackTrace(pw);
            
            String error = "Database Error: " + dateFormat.format(date) + ", message: " + sw.toString() + "\r\n";
            
            FileWriter writer = new FileWriter(new File(path), true);
            writer.append(error);
            writer.flush();
            writer.close();
        } catch(IOException e) {
            System.out.println("IOException occured while trying to log error, message: " + e.getLocalizedMessage());
        }
    }
}
