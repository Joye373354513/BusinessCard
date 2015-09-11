//
//  RegisterViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic)NSMutableArray *areaArray;
@property (assign,  nonatomic) BOOL isNew;

- (IBAction)nextBtnAction:(id)sender;
@end
