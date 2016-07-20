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
import twitter4j.conf.ConfigurationBuilder;

import java.util.List;
import java.util.ArrayList;
import javax.servlet.jsp.PageContext;
import sun.security.jca.GetInstance;
import twitter4j.RateLimitStatus;

/**
 *
 * @author Bradley
 */
public class TwitterHandler {
    private final static String CONSUMER_KEY = "Me7OF5Vmi6ON6SCIjoHBGuYqD";
    private final static String CONSUMER_SECRET_KEY = "wH526KHHOc4e98Z0FicLqDuVFphHyP3BuYkTo8AYgDrApaknhI";
    private static TwitterHandler instance = null;
    private RequestToken requestToken;
    private Twitter twitter;
    
    public static TwitterHandler getInstance(boolean reset)
    {
        if(instance != null && !reset)
            return instance;
        else
        {
            return instance = new TwitterHandler();
        }
    }
    
    private TwitterHandler()
    { 
        try
        {
            ConfigurationBuilder cb = new ConfigurationBuilder();
            cb.setDebugEnabled(true)
                    .setOAuthConsumerKey(CONSUMER_KEY)
                    .setOAuthConsumerSecret(CONSUMER_SECRET_KEY)
                    .setOAuthAccessToken(null)
                    .setOAuthAccessTokenSecret(null);
            TwitterFactory tf = new TwitterFactory(cb.build());
            twitter = tf.getInstance();
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
        }
        catch(Exception ex)
        {
            String s = ex.toString();
        }
    }
    
    public String auth(String callBack)
    {
        try
        {
            requestToken = twitter.getOAuthRequestToken(callBack);
            return requestToken.getAuthorizationURL();
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(Exception ex)
        {
            String s = ex.toString();
        }
        return null;
    }
    
    public AccessToken getAccessToken(String verifier)
    {
        try
        {
            return twitter.getOAuthAccessToken(requestToken, verifier);
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(Exception ex)
        {
            String s = ex.toString();
        }
        return null;
    }
    
    public List<Status> getUserTimeline(String searchPhrase, int pageSize) throws TwitterException
    {   
        String userName = searchPhrase;
        
        if(!userName.contains(" "))
        {
            if(!userName.startsWith("@"))
                userName = '@' + userName;
            
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
                if(ex.resourceNotFound())
                    return getSearchTweets(searchPhrase, pageSize);
            }
            catch(Exception ex)
            {
                String s = ex.toString();
                return null;
            }
        }
        //else
            return getSearchTweets(userName, pageSize);
    }
    
    public List<Status> getSearchTweets(String searchPhrase, int pageSize)
    {
        long lastID = Long.MAX_VALUE;
        ArrayList<Status> tweets = new ArrayList<Status>();
        boolean last = false;
        
        try
        {
            Query query = new Query(searchPhrase);
            
            while(tweets.size() < pageSize && !last)
            {   
                if (pageSize - tweets.size() > 180)
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
            if(ex.exceededRateLimitation())
                return null;       
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
        }
        return null;
    }
    
    public long getUserID()
    {
        try
        {
            return twitter.getId();
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
        }
        return -1;
    }
    
    public String getUserName()
    {
        try
        {
            long userID = twitter.getId();
            return twitter.showUser(userID).getName();
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
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
    
    
    public String getScreenName(){
        try
        {
            return twitter.getScreenName();
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
        }
        return null;
    }
    
    public int getRemainingRateLimit()
    {
        try
        {
            RateLimitStatus rateLimit = twitter.getRateLimitStatus("statuses").get("/statuses/user_timeline");
            int restTime = rateLimit.getSecondsUntilReset();
            return rateLimit.getRemaining();
        }
        catch(TwitterException ex)
        {
            String s = ex.toString();
        }
        catch(IllegalStateException ex)
        {
            String s = ex.toString();
        }
        return  -1;
    }
    
    public  boolean  testAccess()
    {
        try 
        {
            twitter.getOAuthAccessToken();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

}
