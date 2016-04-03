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
