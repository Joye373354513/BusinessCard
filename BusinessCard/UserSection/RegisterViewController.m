//
//  RegisterViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "RegisterViewController.h"
#import "CodeViewController.h"
#import "SMS_SDK/SMS_SDK.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction)];
    [self.navigationItem setLeftBarButtonItem:leftBtn];
    [_bgView circularBoarderBead:5 withBoarder:0.5 color:UIColorFromRGB(0xcccccc)];
    [_nextBtn setBackgroundColor:MainColor];
    [_nextBtn circularBead];
    _areaArray =[[NSMutableArray alloc]init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)backBtnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)nextBtnAction:(id)sender {
    NSString* str2 = [@"86" stringByReplacingOccurrencesOfString:@"+" withString:@""];
    [SMS_SDK getVerificationCodeBySMSWithPhone:_phoneNumTextField.text zone:str2 result:^(SMS_SDKError *error) {
        if (!error) {
            CodeViewController *vc = [[CodeViewController alloc]init];
            vc.isNew = _isNew;
            vc.phoneNum = _phoneNumTextField.text;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else {
            if (error.errorCode == 200) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号码不正确" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
                [alert show];
            }
            else {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription] delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }];
}
@end
