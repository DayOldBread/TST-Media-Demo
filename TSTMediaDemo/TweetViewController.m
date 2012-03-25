//
//  TweetViewController.m
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TweetViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

@synthesize tweetText;
@synthesize tweetTextView;
@synthesize tweetOwner;


/****************************/
/* Accessors */
/****************************/
-(NSString *) tweetText{
    if(!tweetText){
        tweetText = @"";
    }
    return tweetText;
}

-(NSString *) tweetOwner{
    if(!tweetOwner){
        tweetOwner = @"";
    }
    return tweetOwner;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.tweetOwner;
    tweetTextView.text = self.tweetText;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
