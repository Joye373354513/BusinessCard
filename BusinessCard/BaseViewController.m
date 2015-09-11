//
//  BaseViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/14.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showToast:(NSString *)alertString
{
    [self.view makeToast:alertString duration:0.5 position:@"center"];
}
@end
