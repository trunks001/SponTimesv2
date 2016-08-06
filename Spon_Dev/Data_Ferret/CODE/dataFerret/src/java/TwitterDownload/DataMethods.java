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
    
    public static Statement getConnection() throws SQLException, ClassNotFoundException, IOException{
//        String path = "/settings/dataferret.config";
//        
//        File test = new File(path);
//        String testPath = test.getAbsolutePath();
//        
//        Scanner scanner = new Scanner(new File(path));
        String DB_Username = "checkers";
        String DB_Password = "Trunkswilltry001!";
        String DB_URL = "41.185.26.152";
        String DB_Name = "dataferret";
        
        
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
        Connection conn = DriverManager.getConnection("jdbc:mysql://" + DB_URL + " :3306/" + DB_Name, DB_Username, DB_Password);
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
    
    public static void saveDownload(int userId, String filePath) {
        ResultSet res;
        try
        {
            res = getData("SELECT MAX(loginId) FROM Logins WHERE userId = " + userId);
            res.next();
            
            int loginId = res.getInt("MAX(loginId)");
        
            runQuery("INSERT INTO Downloads (userId, loginId, filePath) VALUES ('" + userId + "', " + loginId + ", '" + filePath + "')");
            res.close();
        }
        catch(Exception ex)
        {
            logError(ex);
        }
    }
    
    public static ResultSet getData(String sql) {
        try {
            Statement stmt = getConnection(); 

            ResultSet res = stmt.executeQuery(sql);

            stmt.closeOnCompletion();

            return res;
        } catch(Exception ex) {
            logError(ex);
            return null;
        }
    }
    
    public static void runQuery(String sql) {
        try {
            Statement stmt = getConnection(); 

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
