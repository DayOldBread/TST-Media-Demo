//
//  TwitterAPICall.m
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterAPICall.h"
#import "JSON.h"

@implementation TwitterAPICall

// Adds the common part of a flickr request api url, the api_key and the json specifiers, then performs the query, converts from JSON, and returns.

/************************
 * Creates the twitter api query, performs the query, converts from JSON format, and returns. API calls can return either an array or a dictionary.  It will be up to each caller of this method to ensure they know which result type their query will return, and to do any necesary type checks.
 ************************/

+(id)twitterAPIQuery:(NSString *)queryString {
    
    NSString *apiQueryURL = [NSString stringWithFormat:@"https://api.twitter.com/1/%@.json", queryString];
    
    NSError *error = nil;
    NSString *apiQueryJSON = [NSString stringWithContentsOfURL:[NSURL URLWithString:apiQueryURL] encoding:NSUTF8StringEncoding error:&error];
    
    //if the query attempt fails (e.g. due to no connectivity), show an alert dialogue.
    if (error) {
        NSLog(@"[TwitterAPICall twitterAPIQuery:queryString] %@ (%@)", [error localizedDescription], [error localizedFailureReason]);
        
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"URL Load Error" message:@"Please ensure that your device has internet connectivity and press the refresh button or restart the app.  If the problem persists, check for app updates in the app store or delete the application and re-install from the app store.  We apologize for any inconvenience." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    
    return [apiQueryJSON JSONValue];
    
}

/************************
 * Creates the twitter search query, performs the query, converts from JSON format, and returns.
 ************************/

+(NSDictionary *)twitterSearchQuery:(NSString *)searchString {
    

    NSString *searchQueryURL = [NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@", searchString];
    
    NSError *error = nil;
    NSString *searchQueryJSON = [NSString stringWithContentsOfURL:[NSURL URLWithString:searchQueryURL] encoding:NSUTF8StringEncoding error:&error];
    
    //if the query attempt fails (e.g. due to no connectivity), show an alert dialogue.
    if (error) {
        
        NSLog(@"[TwitterAPICall twitterSearchQuery:searchString] %@ (%@)", [error localizedDescription], [error localizedFailureReason]);
        
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"URL Load Error" message:@"Please ensure that your device is connected to the internet and restart the app.  If the problem persists, check for app updates in the app store or delete the application and re-install from the app store.  We apologize for any inconvenience." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    
    return [searchQueryJSON JSONValue];
    
}

+(NSArray *)topWorldTrends{
    
    /*************************
     * Twitter API for this query returns in the form [{trends:[{name:URL:query:}]}], so it returns an array (apiQueryResult) that contains a dictionary (topLevelDictionary) one of who's keys is trends, which in turn is an array of dictionaries containing the keys: name, URL, and query.  See https://dev.twitter.com/docs/api/1/get/trends/%3Awoeid for more info.
     *************************/
    
    id apiQueryResult = [self twitterAPIQuery:@"trends/1"];
    
    
    if(!apiQueryResult){
        //if the the result of the query was nil, then return nil.
        return nil;
    }else if([apiQueryResult isKindOfClass:[NSArray class]]){
        //if the result was not nil and is of the type we are expecting, then return the trends array.
        NSDictionary *topLevelDictionary = [apiQueryResult objectAtIndex:0];
        return [topLevelDictionary objectForKey:@"trends"];
        
    }else{
        //if the result was not nil and is not the type we are expecting, display an alert dialogue.  This would likely be caused by an API change.
        NSLog(@"Error in [TwitterAPICall topWorldTrends] - unexpected return type from api query");
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Twitter API Query Error" message:@"Please close this message and quit the application using the Home button.  If the problem persists, check for app updates in the app store or delete the application and re-install from the app store.  We apologize for any inconvenience." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [errorAlert show];

        return nil;
    }
}

+(NSArray *)searchResults:(NSString *) searchString{
    
    /********************
     * The twitter search API call returns a dictionary (searchQueryResult), one of whose keys is results, which is an array of Dictionaries containing (among other data) the text of the tweet.  See https://dev.twitter.com/docs/api/1/get/search for more details.
     ********************/
    
    NSDictionary *searchQueryResult = [self twitterSearchQuery:searchString];
    return [searchQueryResult objectForKey:@"results"];
    
}


@end

