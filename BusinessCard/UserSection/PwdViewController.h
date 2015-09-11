//
//  PwdViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/18.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"
#import <TPKeyboardAvoidingScrollView.h>

@interface PwdViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *menBtn;
@property (weak, nonatomic) IBOutlet UIButton *womenBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *textFieldView;

- (IBAction)menBtnAction:(id)sender;
- (IBAction)womenBtnAction:(id)sender;
- (IBAction)registerBtnAction:(id)sender;


@end
