//
//  TopicTweetsViewController.m
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopicTweetsTableViewController.h"
#import "TwitterAPICall.h"
#import "TweetViewController.h"

@interface TopicTweetsTableViewController ()

@property (strong, nonatomic) NSArray *searchResults;

@end

@implementation TopicTweetsTableViewController

@synthesize twitterSearchQueryString;
@synthesize searchResults;
@synthesize searchTopic;

/****************************/
/* Accessors */
/****************************/
-(NSString *) searchTopic{
    if(!searchTopic){
        searchTopic = @"Search Results";
    }
    return searchTopic;
}

-(NSString *) twitterSearchQueryString{
    if(!twitterSearchQueryString){
        twitterSearchQueryString = @"";
    }
    return twitterSearchQueryString;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = self.searchTopic;
    self.searchResults = [TwitterAPICall searchResults:self.twitterSearchQueryString];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TopicTweetsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //configure cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //set the cell text to the text of the tweet
    cell.textLabel.text = [[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"text"];
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if a cell is selected, push a view controller that shows the author and full text of the tweet.
    TweetViewController *tVC = [[TweetViewController alloc] init];
    tVC.tweetText = [[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"text"];
    tVC.tweetOwner = [[self.searchResults objectAtIndex:indexPath.row] objectForKey:@"from_user"];
    
    [self.navigationController pushViewController:tVC animated:YES];
    
}

@end
