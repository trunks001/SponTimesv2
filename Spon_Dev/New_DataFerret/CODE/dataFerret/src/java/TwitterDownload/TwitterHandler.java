/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TwitterDownload;

import twitter4j.Paging;
import twitter4j.ResponseList;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.Status;
import twitter4j.Query;
import twitter4j.QueryResult;

import java.util.List;
import java.util.ArrayList;
import twitter4j.RateLimitStatus;

/**
 *
 * @author Bradley
 */
public class TwitterHandler {
    private final static String CONSUMER_KEY = "Me7OF5Vmi6ON6SCIjoHBGuYqD";
    private final static String CONSUMER_SECRET_KEY = "wH526KHHOc4e98Z0FicLqDuVFphHyP3BuYkTo8AYgDrApaknhI";
    private static TwitterHandler instance = null;
    private static RequestToken requestToken;
    private static Twitter twitter;
    private static AccessToken accessToken = null;
    private static String callback = "";

    public static TwitterHandler getInstance()
    {
        callback = "http://localhost:8080/dataFerret";
        if(instance == null)
            instance = new TwitterHandler(callback);
        
        return instance;
    }
    
    public static TwitterHandler getInstance(String callString)
    {
        callback = callString;
        if(instance == null)
            instance = new TwitterHandler(callback);
        
        return instance;
    }
    
    private TwitterHandler(String callback)
    {
        
        twitter = TwitterFactory.getSingleton();
        twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET_KEY);
        try
        {
            requestToken = twitter.getOAuthRequestToken(callback);
        }
        catch(TwitterException ex)
        {
            
        }
    }
    
    public String auth()
    {
            return requestToken.getAuthorizationURL();
    }
    
    public AccessToken getAccessToken(String verifier) throws TwitterException
    {
        if(accessToken == null)
            accessToken = twitter.getOAuthAccessToken(requestToken, verifier);
        return accessToken;
    }
    
    public List<Status> getUserTimeline(String userName, int pageSize) throws TwitterException
    {   
        if(!userName.contains(" "))
        {
            long lastID = Long.MAX_VALUE;
            ArrayList<Status> tweets = new ArrayList<Status>();
            int count = 200;
            
            try
            {
                int i = 0;
                while(tweets.size() < pageSize)
                {
                    i++;
                    if (pageSize - tweets.size() > 200)
                        count = 200;
                    else
                        count = pageSize - tweets.size();
                    
                    Paging page = new Paging(i, count);
                    //page.maxId(lastID);

                    List<Status> l = twitter.getUserTimeline(userName, page);
                                        
                    tweets.addAll(l);
                    
                    if(l.size() < 200)
                    {
                        break;
                    }

                    for (Status t: tweets) 
                    {
                        if(t.getId() < lastID)
                            lastID = t.getId();
                        else if (t.getId() == lastID)
                            break;
                    }
                }
                
                return (List<Status>)tweets;
            }
            catch(TwitterException ex)
            {
                String s = ex.toString();
                //needs to be refined to only include user not found exception
                return getSearchTweets(userName, pageSize);
            }
            catch(Exception ex)
            {
                String s = ex.toString();
                return null;
            }
        }
        else
            return getSearchTweets(userName, pageSize);
    }
    
    public List<Status> getSearchTweets(String searchPhrase, int pageSize) throws TwitterException
    {
        
        
        long lastID = Long.MAX_VALUE;
        ArrayList<Status> tweets = new ArrayList<Status>();
        boolean last = false;
        
        try
        {
            Query query = new Query(searchPhrase);
            
            while(tweets.size() < pageSize && !last)
            {   
                if (pageSize - tweets.size() > 100)
                    query.setCount(100);
                else
                    query.setCount(pageSize - tweets.size());
                
                query.maxId(lastID);
                
                QueryResult result = twitter.search(query);
                tweets.addAll(result.getTweets());
                
                for (Status t: tweets) 
                {
                    if(t.getId() < lastID) 
                        lastID = t.getId();
                    else if(lastID == t.getId())
                    {
                        if(result.hasNext())
                        {
                            query = result.nextQuery();
                            break;
                        }
                        else
                        {
                            last = true;
                            break;
                        }
                    }
                }
                        
            }

            return (List<Status>)tweets;
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
            return null;
        }
    }
    
    public long getUserID() throws TwitterException
    {
        if(accessToken != null)
        {
            return twitter.getId();
        }
        return -1;
    }
    
    public String getUserName() throws TwitterException
    {
        if(accessToken != null)
        {
            long userID = twitter.getId();
            return twitter.showUser(userID).getName();
        }
        return null;
    }
    
    public static String[] getKeys()
    {
        return new String[] {CONSUMER_KEY, CONSUMER_SECRET_KEY};
    }
    
    public RequestToken getRequestToken()
    {
        return requestToken;
    }
    
    public AccessToken getAccessToken(){
        return accessToken;
    }
    
    public String getScreenName(){
        try
        {
            return twitter.getScreenName();
        }
        catch(TwitterException ex)
        {
            return null;
        }
    }
    
    public int getRemainingRateLimit() throws TwitterException
    {
        RateLimitStatus rateLimit = twitter.getRateLimitStatus("statuses").get("/statuses/user_timeline");
        int restTime = rateLimit.getSecondsUntilReset();
        return rateLimit.getRemaining();
    }

}
