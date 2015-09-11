//
//  UIView+border.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"

@interface UIView (border)
- (void)border;
- (void)circularBead;
- (void)border:(float)width;
- (void)rightBorder:(float)width;
- (void)leftBorder:(float)width;
- (void)bottomBorder:(float)width;
- (void)bottomBorder:(float)width color:(CGColorRef)color;
- (void)topBorder:(float)width;
- (void)bottomBorder:(float)width withColor:(UIColor *) color;
- (void)topBorder:(float)width withColor:(UIColor *) color;
- (void)circular;
- (void)circularBoarderBead:(float)radius withBoarder:(float)width color:(UIColor *)color;
@end
