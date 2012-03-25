//
//  TwitterAPICall.h
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/************************
 * This class handles the accessing of the Twitter API.
 ************************/

@interface TwitterAPICall : NSObject

/************************
 * Returns the top world trending topics as an array of dictionaries.  Each dictionary has the following keys: "name" (the name of the topic), "url" (the search URL), and "query", the search query string. See https://dev.twitter.com/docs/api/1/get/trends/%3Awoeid for more information.
 ************************/
+(NSArray *)topWorldTrends;


/************************
 * Returns the search results for the given searchString as an array of dictionaries.  Each dictionary has many keys including "text" (the text of the tweet) and "from_user" (the author).  The other keys and more information can be found at https://dev.twitter.com/docs/api/1/get/search
 ************************/
+(NSArray *)searchResults:(NSString *) searchString;

@end


