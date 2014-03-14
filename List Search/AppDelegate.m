//
//  AppDelegate.m
//  List Search
//
//  Created by Giles Van Gruisen on 3/13/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

#import "AppDelegate.h"
#import "TableSearchViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = [TableSearchViewController new];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
