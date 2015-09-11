//
//  LoginViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/14.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_textFieldView circularBoarderBead:10 withBoarder:0.5 color:UIColorFromRGB(0xffffff)];
    [_headerImageView circular];
    [_loginBtn setBackgroundColor:UIColorFromRGB(0x33b5e5)];
    [_loginBtn circularBead];
    [_phoneNumTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_pwdTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_scrollView addSubview:_bgView];
    _bgView.height = MainScreenHeight;
    _bgView.width = MainScreenWidth;
    [_scrollView setContentSize:CGSizeMake(MainScreenWidth, MainScreenHeight)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loginBtnAction:(id)sender {
    if (self.LoginCallBack) {
        _LoginCallBack();
    }
}

- (IBAction)forgetPwdBtnAction:(id)sender {
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.isNew = NO;
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)registerBtnAction:(id)sender {
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.isNew = YES;
    [self presentViewController:nav animated:YES completion:nil];
}
@end
