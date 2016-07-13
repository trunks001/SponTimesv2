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

import jxl.*;
import jxl.read.biff.BiffException;
import jxl.write.*;
import jxl.write.Boolean;
import jxl.write.Number;
import jxl.write.biff.RowsExceededException;

import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Status;

/**
 *
 * @author Bradley
 */
public class TwitterExel {
    
    static String AbsolutePath = new File(".").getAbsolutePath() + "/Tweets";
    
    public static void WriteTest(){
        try {
            File exlFile = new File(AbsolutePath + "/write_test.xls");
            WritableWorkbook writableWorkbook = null;
            WritableSheet writableSheet = null;
            if(!exlFile.exists())
            {
                writableWorkbook = Workbook.createWorkbook(exlFile);

                writableSheet= writableWorkbook.createSheet("Sheet1", 0);
            }
            else
            {
                try{
                    Workbook existing = Workbook.getWorkbook(exlFile);
                    writableWorkbook = Workbook.createWorkbook(exlFile, existing);

                    writableSheet = writableWorkbook.getSheet(0);
                }
                catch(BiffException be)
                {
                    
                }
            }
 
            //Create Cells with contents of different data types.
            //Also specify the Cell coordinates in the constructor
            
            int i = writableSheet.getRows();
            
            Label label = new Label(0, i, "Label (String)");
            DateTime date = new DateTime(1, i, new Date());
            Boolean bool = new Boolean(2, i, true);
            Number num = new Number(3, i, 9.99);
 
            
            
            //Add the created Cells to the sheet
            writableSheet.addCell(label);
            writableSheet.addCell(date);
            writableSheet.addCell(bool);
            writableSheet.addCell(num);
            
            
            
//            label = new Label(0, 1, "Label (String)");
//            date = new DateTime(1, 1, new Date());
//            bool = new Boolean(2, 1, true);
//            num = new Number(3, 1, 9.99);
//            writableSheet.addCell(label);
//            writableSheet.addCell(date);
//            writableSheet.addCell(bool);
//            writableSheet.addCell(num);
//            
//            i = writableSheet.getRows();
            
            writableWorkbook.write();
            
            
            
            //Write and close the workbook
            
            writableWorkbook.close();
 
        } catch (IOException e) {
            e.printStackTrace();
        } catch (RowsExceededException e) {
            e.printStackTrace();
        } catch (WriteException e) {
            e.printStackTrace();
        }
    }
    
    public static void clearBuffer(long ID)
    {
        String exlPath = AbsolutePath + "/" + ID + ".xls";
        File exlFile = new File(exlPath);
        if(exlFile.exists())
        {
            exlFile.delete();
        }
    }
    
    public static String writeTweets(long ID, ResponseList<Status> tweets)
    {
        return writeTweets(ID, (List<Status>)tweets);
    }
    
    public static String writeTweets(long ID, List<Status> tweets)
    {
        try {            
            File theDir = new File(AbsolutePath);

            // if the directory does not exist, create it
            if (!theDir.exists())
            {
              theDir.mkdir();
            }
            
            String exlPath = AbsolutePath + "/" + ID + ".xls";
            File exlFile = new File(exlPath);
            WritableWorkbook writableWorkbook = null;
            WritableSheet writableSheet = null;
            if(exlFile.exists())
            {
                exlFile.delete();
            }

            writableWorkbook = Workbook.createWorkbook(exlFile);

            writableSheet= writableWorkbook.createSheet("Sheet1", 0);

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
            
            int i = writableSheet.getRows();
            
            if(i == 0)
            {
                Label text = new Label(0, 0, "Tweeted Text");
                Label date = new Label(1, 0, "Tweeted Date");
                Label reTweets = new Label(2, 0, "ReTweet Count");
                Label favor = new Label(3, 0, "Favourite Count");

                //Add the created Cells to the sheet
                writableSheet.addCell(text);
                writableSheet.addCell(date);
                writableSheet.addCell(reTweets);
                writableSheet.addCell(favor);
                
                i = 1;
            }
            
            
            
            for(int j = 0; j < tweets.size(); j++)
                {
                    Status s = tweets.get(j);
                    
                    Label text = new Label(0, i + j, s.getText());
                    DateTime date = new DateTime(1, i + j, s.getCreatedAt());
                    Number reTweets = new Number(2, i + j, s.getRetweetCount());
                    Number favor = new Number(3, i + j, s.getFavoriteCount());
                    
                    //Add the created Cells to the sheet
                    writableSheet.addCell(text);
                    writableSheet.addCell(date);
                    writableSheet.addCell(reTweets);
                    writableSheet.addCell(favor);
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
