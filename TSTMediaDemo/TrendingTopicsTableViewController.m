//
//  TrendingTopicsTableViewController.m
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrendingTopicsTableViewController.h"
#import "TwitterAPICall.h"
#import "TopicTweetsTableViewController.h"

@interface TrendingTopicsTableViewController ()
    @property (strong, nonatomic) NSArray *trends;

@end

@implementation TrendingTopicsTableViewController

@synthesize trends;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Top Twitter Trends";
    }
    return self;
}

/************************
 * Gets the current trending data and refreshes the table
 ************************/
- (void)reloadTrends{
    self.trends = [TwitterAPICall topWorldTrends];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    //refresh the trending data when the view appears.
    [self reloadTrends];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //get the current top world trending topics
    self.trends = [TwitterAPICall topWorldTrends];    
    
    //so that the back button navigating back to this view has a shorter name and doesn't take up so much space on the navigation bar.
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Trends" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    //place a button on the navigation bar that lets users refresh the trending data.
    UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStyleBordered target:self action:@selector(reloadTrends)];
    self.navigationItem.rightBarButtonItem = reloadButton;
    
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
    return [self.trends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TrendingTopicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //configure cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //set the cell text to the trending topic
    cell.textLabel.text = [[self.trends objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if a cell is selected, push a view controller that shows tweets containing the selected trending topic
    TopicTweetsTableViewController *ttTVC = [[TopicTweetsTableViewController alloc] init];
    ttTVC.twitterSearchQueryString = [[self.trends objectAtIndex:indexPath.row] objectForKey:@"query"];
    ttTVC.searchTopic = [[self.trends objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    [self.navigationController pushViewController:ttTVC animated:YES];
    
}

@end
