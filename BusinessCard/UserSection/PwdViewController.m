//
//  PwdViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/18.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "PwdViewController.h"

@interface PwdViewController ()

@end

@implementation PwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写信息";
    [_registerBtn setBackgroundColor:UIColorFromRGB(0x33b5e5)];
    [_registerBtn circularBead];
    [_bgView circularBoarderBead:5 withBoarder:0.5 color:UIColorFromRGB(0xcccccc)];
    [_scrollView addSubview:_textFieldView];
    _textFieldView.height = MainScreenHeight;
    _textFieldView.width = MainScreenWidth;
    [_scrollView setContentSize:CGSizeMake(MainScreenWidth, MainScreenHeight)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)menBtnAction:(id)sender {
    [_menBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

- (IBAction)womenBtnAction:(id)sender {
}

- (IBAction)registerBtnAction:(id)sender {
    
}
@end
