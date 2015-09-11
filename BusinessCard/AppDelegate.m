//
//  AppDelegate.m
//  BusinessCard
//
//  Created by tom.sun on 15/7/30.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MainTabBarController.h"
#import <SMS_SDK/SMS_SDK.h>

#define appKey @"9bc2fe619820"
#define appSecret @"f36becf9504cfe6f18d1d050aef94074"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [SMS_SDK registerApp:appKey withSecret:appSecret];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window.backgroundColor = [UIColor whiteColor];
    [self showLoginVC];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)showLoginVC
{
    LoginViewController * vc = [[LoginViewController alloc] init];
    self.window.rootViewController = vc;
    [vc setLoginCallBack:^{
        [self showHomeVc];
    }];
}

- (void)showHomeVc
{
    MainTabBarController *tabBarVc = [[MainTabBarController alloc]init];
    self.window.rootViewController = tabBarVc;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
