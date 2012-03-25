//
//  TweetViewController.h
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/************************
 * This class displays the author and text of a tweet.
 ************************/

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController{
    NSString *tweetText;
    NSString *tweetUser;
    IBOutlet UITextView *tweetTextView;
}

@property (strong, nonatomic) NSString *tweetText;
@property (strong, nonatomic) NSString *tweetOwner;
@property (strong, nonatomic) IBOutlet UITextView *tweetTextView;

@end
