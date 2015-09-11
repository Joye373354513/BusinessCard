//
//  BaseViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/14.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"
#import "UIView+border.h"
#import "UIView+frame.h"
#import <UIView+Toast.h>

@interface BaseViewController : UIViewController

- (void)showToast:(NSString *)alertString;
@end
