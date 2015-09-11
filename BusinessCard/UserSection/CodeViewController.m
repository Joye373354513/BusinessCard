//
//  CodeViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "CodeViewController.h"
#import "PwdViewController.h"
#import "SMS_SDK/SMS_SDK.h"
#import "ForgetPwdViewController.h"

static int count = 0;
@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证短信";
    [_textFieldView circularBoarderBead:5 withBoarder:0.5 color:UIColorFromRGB(0xcccccc)];
    _descriptionLabel.text = [NSString stringWithFormat:@"我们已向手机号码 %@ 发送了一条验证短信",_phoneNum];
    [_nextBtn setBackgroundColor:MainColor];
    [_nextBtn circularBead];
    [_sendBtn leftBorder:0.5];
     _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)updateTime
{
    count++;
    if (count>=60) {
        [_timer invalidate];
        [_sendBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        _sendBtn.enabled = YES;
        return;
    }
    [_sendBtn setTitle:[NSString stringWithFormat:@"%d秒",60-count] forState:UIControlStateNormal];
    _sendBtn.enabled = NO;
}

- (IBAction)sendBtnAction:(id)sender {
    NSString* str2=[@"86" stringByReplacingOccurrencesOfString:@"+" withString:@""];
    [SMS_SDK getVerificationCodeBySMSWithPhone:_phoneNum zone:str2 result:^(SMS_SDKError *error) {
        if (!error) {
            count = 0;
            _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        }
        else {
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription] delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

- (IBAction)nextBtnAction:(id)sender {
    [SMS_SDK commitVerifyCode:_codeTextField.text result:^(enum SMS_ResponseState state) {
        if (1==state) {
            if (_isNew) {
                PwdViewController *vc = [[PwdViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else {
                ForgetPwdViewController *vc = [[ForgetPwdViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
        else if(0==state)
        {
            UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码错误" delegate:self cancelButtonTitle:@"好"  otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}
@end
