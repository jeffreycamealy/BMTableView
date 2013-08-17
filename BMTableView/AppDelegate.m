//
//  AppDelegate.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

#pragma mark - AppDelegate Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupWindow];
    [self setupRootVC];
    return YES;
}


#pragma mark - Private API

- (void)setupWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
}

- (void)setupRootVC {
    
}

@end
