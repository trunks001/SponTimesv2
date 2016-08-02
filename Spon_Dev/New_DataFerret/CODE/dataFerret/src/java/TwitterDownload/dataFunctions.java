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
import java.sql.*;

public class dataFunctions {
    
//    static final String USER = "root";
//    static final String PASS = "root";
//
//    
//    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
//    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/dataferret";
    
    static final String USER = "checkers";
    static final String PASS = "Trunkswilltry001!";

    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://41.185.26.152:3306/dataferret";
    
    public static Statement getConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
        Statement stmt = conn.createStatement();
        return  stmt;
    }
    
    
    public static ResultSet getUser(String userId) throws SQLException, ClassNotFoundException {
       
        ResultSet res = getData("SELECT * FROM Users WHERE userId = '" + userId + "'");
        
        return res;
    }
    
    public static int saveUser(long twitterId, String screenName, String userName) throws SQLException, ClassNotFoundException {
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
        
        return ret;
        }
        catch(Exception ex)
        {
            return -1;
        }
        finally
        {
            result.close();
        }
    }
    
    public static void saveLogin(int userId, String ipAddress) throws SQLException, ClassNotFoundException {
        runQuery("INSERT INTO Logins (userId, ipAddress) VALUES ('" + userId + "', '" + ipAddress + "')");
    }
    
    public static void saveDownload(int userId, String filePath) throws SQLException, ClassNotFoundException {
        ResultSet res = getData("SELECT MAX(loginId) FROM Logins WHERE userId = " + userId);
        try
        {
            res.next();
            
            int loginId = res.getInt("MAX(loginId)");
        
            runQuery("INSERT INTO Downloads (userId, loginId, filePath) VALUES ('" + userId + "', " + loginId + ", '" + filePath + "')");
        }
        catch(Exception ex)
        {
            int i = 0;
        }
        finally
        {
            res.close();
        }
    }
    
    public static ResultSet getData(String sql) throws SQLException, ClassNotFoundException{
        Statement stmt = getConnection(); 
        
        ResultSet res = stmt.executeQuery(sql);
        
        stmt.closeOnCompletion();
        
        return res;
    }
    
    public static void runQuery(String sql) throws SQLException, ClassNotFoundException{
        Statement stmt = getConnection(); 
        
        stmt.execute(sql);
        
        stmt.closeOnCompletion();
    }
}
