/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package TwitterDownload;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.net.URL;

import jxl.*;
import jxl.read.biff.BiffException;
import jxl.write.*;
import jxl.write.Boolean;
import jxl.write.Number;
import jxl.write.biff.RowsExceededException;
import twitter4j.GeoLocation;

import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Status;

/**
 *
 * @author Bradley
 */
public class TwitterExel {
    
    
    public static String writeTweets(long ID, ResponseList<Status> tweets, String path)
    {
        return writeTweets(ID, (List<Status>)tweets, path);
    }
    
    public static String writeTweets(long ID, List<Status> tweets, String path)
    {
        try {            
            path = path + "/Tweets";
            
            File theDir = new File(path);

            // if the directory does not exist, create it
            if (!theDir.exists())
            {
              theDir.mkdir();
            }
            
            String exlPath = path + "/" + ID + ".xls";           
            
            File exlFile = new File(exlPath);
            WritableWorkbook writableWorkbook = null;
            WritableSheet writableSheet = null;
            int i = 0;
            if(exlFile.exists())
            {
                i++;
                
                exlPath = path + "/" + ID + "_" + i + ".xls";
                
                exlFile = new File(exlPath);
            }

            writableWorkbook = Workbook.createWorkbook(exlFile);

            writableSheet= writableWorkbook.createSheet("FerretData", 0);

            try{
                Workbook existing = Workbook.getWorkbook(exlFile);
                writableWorkbook = Workbook.createWorkbook(exlFile, existing);

                writableSheet = writableWorkbook.getSheet(0);
            }
            catch(BiffException be)
            {

            }
 
            //Create Cells with contents of different data types.
            //Also specify the Cell coordinates in the constructor
            
            i = 0;
            i = writableSheet.getRows();
            
            if(i == 0)
            {
                Label text = new Label(0, 0, "Tweeted Text");
                Label date = new Label(1, 0, "Tweeted Date");
                Label reTweets = new Label(2, 0, "ReTweet Count");
                Label favor = new Label(3, 0, "Favourite Count");
                Label place = new Label(4, 0, "Place");
                Label geo = new Label(5, 0, "GeoLocation");
                Label link = new Label(6, 0, "Link");
                Label user = new Label(7, 0, "User");

                //Add the created Cells to the sheet
                writableSheet.addCell(text);
                writableSheet.addCell(date);
                writableSheet.addCell(reTweets);
                writableSheet.addCell(favor);
                writableSheet.addCell(place);
                writableSheet.addCell(geo);
                writableSheet.addCell(link);
                writableSheet.addCell(user);
                
                i = 1;
            }
            
            
            
            for(int j = 0; j < tweets.size(); j++)
                {
                    Status s = tweets.get(j);
                    
                    String placeString = s.getPlace()!= null?s.getPlace().toString():"";
                    if(placeString.contains("{"))
                        placeString = placeString.substring(placeString.indexOf("{"), placeString.length()-1);
                    
                    Label text = new Label(0, i + j, s.getText());
                    DateTime date = new DateTime(1, i + j, s.getCreatedAt());
                    Number reTweets = new Number(2, i + j, s.getRetweetCount());
                    Number favor = new Number(3, i + j, s.getFavoriteCount());
                    Label place = new Label(4, j + 1, placeString);
                    Label geo = new Label(5, j + 1, s.getGeoLocation() != null?s.getGeoLocation().toString():"");
                    
                    String link = "https://twitter.com/" + s.getUser().getScreenName() + "/status/" + s.getId();
                    URL url = new URL(link);
                    
                    WritableHyperlink hl = new WritableHyperlink(6, j + 1, url);
                    
                    Label user = new Label(7, j + 1, s.getUser().getScreenName());
                    
                    //Add the created Cells to the sheet
                    writableSheet.addCell(text);
                    writableSheet.addCell(date);
                    writableSheet.addCell(reTweets);
                    writableSheet.addCell(favor);
                    writableSheet.addCell(place);
                    writableSheet.addCell(geo);
                    writableSheet.addHyperlink(hl);
                    writableSheet.addCell(user);
                }

            //Write and close the workbook
            writableWorkbook.write();
            writableWorkbook.close();
            
            return exlPath;
 
        } catch (IOException e) {
            e.printStackTrace();
        } catch (RowsExceededException e) {
            e.printStackTrace();
        } catch (WriteException e) {
            e.printStackTrace();
        }      
        return null;
    }
    
}
