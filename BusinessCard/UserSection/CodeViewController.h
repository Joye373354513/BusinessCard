//
//  CodeViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"

@interface CodeViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *textFieldView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (copy, nonatomic) NSString *phoneNum;
@property (strong, nonatomic)NSTimer *timer;
@property (assign,  nonatomic) BOOL isNew;

- (IBAction)sendBtnAction:(id)sender;
- (IBAction)nextBtnAction:(id)sender;
@end
