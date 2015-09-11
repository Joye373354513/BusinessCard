//
//  UIView+frame.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/17.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)
- (CGFloat)originX;
- (CGFloat)originY;
- (CGPoint)origin;
- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

- (void)setOriginX:(CGFloat)x;
- (void)setOriginY:(CGFloat)y;
- (void)setOrigin:(CGPoint)origin;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setSize:(CGSize)size;

- (void)setOriginX:(CGFloat)x originY:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
@end
