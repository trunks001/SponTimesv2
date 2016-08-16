/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TwitterDownload;

/**
 *
 * @author dvt
 */
public class Product {
    private String name = "";
    private double price = 0.00;
            
    public Product(String name) {
        this.name = name;
    }
    
    public String getName() {
       return this.name;
    }
    
    public String getPrice() {
        return "R" + price;
    }
}