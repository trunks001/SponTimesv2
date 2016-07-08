package mypackage;

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
    Connection conn = null;
    Statement stmt = null;
    ResultSet res = null;
    
    static final String USER = "checkers";
    static final String PASS = "Trunkswilltry001!";

    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://41.185.26.152:3306/SpontaneousDatabase";
    
    public void getConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
    }
    
    public void closeConnection() throws SQLException{
        if(res != null)
            res.close();
        stmt.close();
        conn.close();
    }
    
    public ResultSet getData(String sql) throws SQLException, ClassNotFoundException{
        getConnection(); 
        
        res = stmt.executeQuery(sql);
         
        return res;
    }
    
    public void runQuery(String sql) throws SQLException, ClassNotFoundException{
        getConnection(); 
        
        stmt.execute(sql);
        
        closeConnection();
    }
}
