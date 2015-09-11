//
//  LoginViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/14.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"
#import "RegisterViewController.h"
#import <TPKeyboardAvoidingScrollView.h>

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *textFieldView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (copy, nonatomic) void (^LoginCallBack)();
- (IBAction)loginBtnAction:(id)sender;
- (IBAction)forgetPwdBtnAction:(id)sender;
- (IBAction)registerBtnAction:(id)sender;
@end
