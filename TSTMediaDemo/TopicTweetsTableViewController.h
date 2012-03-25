//
//  TopicTweetsViewController.h
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/************************
 * This class displays twitter search results.
 ************************/

#import <UIKit/UIKit.h>

@interface TopicTweetsTableViewController : UITableViewController{
    NSString *twitterSearchQueryString;
    NSArray *searchResults;
    NSString *searchTopic;
}

@property (strong, nonatomic) NSString *searchTopic;

//the correctly formatted twitter search query string
@property (strong, nonatomic) NSString *twitterSearchQueryString;




@end
