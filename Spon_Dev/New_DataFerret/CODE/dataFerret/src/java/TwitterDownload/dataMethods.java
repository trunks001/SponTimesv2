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
import java.sql.*;
import java.util.Scanner;

public class dataMethods {
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
    public static Statement getConnection() throws SQLException, ClassNotFoundException, IOException{
        Scanner scanner = new Scanner(new File("../../../web/settings/settings.config"));
        String DB_Username = "";
        String DB_Password = "";
        String DB_URL = "";
        String DB_Name = "";
        
        while(scanner.hasNext()) {
            String line = scanner.nextLine();
            int index = line.indexOf(":");
            String key = line.substring(0, index).trim();
            String value = line.substring(index + 1, line.length()).trim();
            
            switch(key) {
                case "databaseURL": 
                    DB_URL = value;
                    if(DB_URL.charAt(DB_URL.length() - 1) != '/') {
                        DB_URL += "/";
                    }
                    break;
                case "databaseName":
                    DB_Name = value;
                    break;
                case "databaseUsername":
                    DB_Username = value;
                    break;
                case "databasePassword":
                    DB_Password = value;
                    break;
            }
        }
        scanner.close();
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DB_URL + DB_Name, DB_Username, DB_Password);
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
            FileWriter writer = new FileWriter(new File("../../../web/log/error.log"));
            writer.write("Error while writing to database at time " + System.currentTimeMillis() + ", message: " + ex.getLocalizedMessage());
            writer.flush();
            writer.close();
        } catch(IOException e) {
            System.out.println("IOException occured while trying to log error, message: " + e.getLocalizedMessage());
        }
    }
}
