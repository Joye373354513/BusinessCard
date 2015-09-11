//
//  MainTabBarController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/27.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "MainTabBarController.h"
#import "ProfileViewController.h"
#import "BusinesspartnerListViewController.h"
#import "NewsViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = MainColor;
    BusinesspartnerListViewController *controller1 = [[BusinesspartnerListViewController alloc]init];
    UINavigationController *navigation1 = [[UINavigationController alloc]initWithRootViewController:controller1];
    UITabBarItem * item1 = [[UITabBarItem alloc] initWithTitle:@"名片夹" image:[UIImage imageNamed:@"tab_card"] tag:1];
    controller1.tabBarItem = item1;
    navigation1.navigationBar.barTintColor = MainColor;
    [navigation1.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    NewsViewController *controller2 = [[NewsViewController alloc]init];
    UINavigationController *navigation2 = [[UINavigationController alloc]initWithRootViewController:controller2];
    UITabBarItem * item2 = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"tab_message"] tag:2];
    controller2.tabBarItem = item2;
    navigation2.navigationBar.barTintColor = MainColor;
    [navigation2.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    ProfileViewController *controller3 = [[ProfileViewController alloc]init];
    UINavigationController *navigation3 = [[UINavigationController alloc]initWithRootViewController:controller3];
    UITabBarItem * item3 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_profile"] tag:3];
    controller3.tabBarItem = item3;
    navigation3.navigationBar.barTintColor = MainColor;
    [navigation3.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.viewControllers = @[navigation1,navigation2,navigation3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
