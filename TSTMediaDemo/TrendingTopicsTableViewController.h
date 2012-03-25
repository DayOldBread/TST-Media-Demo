//
//  TrendingTopicsTableViewController.h
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/************************
 * This class displays the current top world trending topics in a table view.
 ************************/

#import <UIKit/UIKit.h>

@interface TrendingTopicsTableViewController : UITableViewController{
    NSArray *trends;
}

-(void)reloadTrends;

@end
