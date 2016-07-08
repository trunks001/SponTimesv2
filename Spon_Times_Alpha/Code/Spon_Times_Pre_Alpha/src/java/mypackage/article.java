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

public class article {
    private String header;
    private String body;
    
    private articleTrailer trailer;
    
    private articleRating rating;
    
    private int views;
    
    public article(String header, String body){
        this.header = header;
        this.body = body;
        
        this.trailer = new articleTrailer(header, body.length() > 255?body.substring(0, 255):body);
    }
    
    public article(String header, String body, articleTrailer trailer){
        this.header = header;
        this.body = body;
        
        this.trailer = trailer;
    }
    
    public String print(){
        return header + "</br>" + body;
    }
    
    public String printTrailer(){
        return trailer.print();
    }
    
    public void vote(double stars){
        rating.vote(stars);
    }
    
    public double getRating(){
        return rating.getRating();
    }
    
    public int save() throws SQLException, ClassNotFoundException{
            dataFunctions dat = new dataFunctions();
            String sql = "INSERT INTO article (articleHeader, articleBody) VALUES ('" + header + "','" + body +"')";
            dat.runQuery(sql);
            ResultSet res = dat.getData("SELECT MAX(pkArticleID) as pkArticleID FROM article;");
            int id = -1;
            if(res.next())
                id = res.getInt("pkArticleID");
            dat.closeConnection();
            
            if(id > 0)
            {
                trailer.save(id);
            }
            
            return id;
        }
    
    private class articleTrailer{
        private String header;
        private String body;
        
        public articleTrailer(String header, String body){
            this.header = header;
            this.body = body;
        }
        
        public String print(){
            return header + "</br>" + body;
        }
        
        public void save(int articleID) throws SQLException, ClassNotFoundException{
            dataFunctions dat = new dataFunctions();
            String sql = "INSERT INTO ArticleTrailers (fkArticleID, trailerHeader, trailerBody) VALUES ("+ articleID +", '" + header + "', '" + body +"')";
            dat.runQuery(sql);
        }
    }
    
    public class articleRating{
        private double rating;
        private double noOfVotes;
        
        public articleRating(){
            rating = 2.5;
            noOfVotes = 0;
        }
        
        public void setRating(double rating){
            if(rating > 5)
                rating = 5;
            if(rating < 0)
                rating = 0;
            this.rating = rating;
        }
        
        public double getRating(){
            return rating;
        }
        
        public void vote(double stars){
            double rating = (this.rating + stars/noOfVotes);
            setRating(rating);
        }    
    }
}
