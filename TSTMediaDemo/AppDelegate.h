//
//  AppDelegate.h
//  TSTMediaDemo
//
//  Created by Daniel O'Brien on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/************************
* This is a simple App that queries Twitter data using the Twitter AP and displays it in a series of views.
 ************************/

#import <UIKit/UIKit.h>
#define FlickrAPIKey @"f08503f8020ce82af083a9c8dd5ec474"

@class TrendingTopicsTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TrendingTopicsTableViewController *viewController;

@end
