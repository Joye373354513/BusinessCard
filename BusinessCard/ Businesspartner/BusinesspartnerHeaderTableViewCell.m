//
//  BusinesspartnerHeaderTableViewCell.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/31.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BusinesspartnerHeaderTableViewCell.h"
#import "UIView+border.h"

@implementation BusinesspartnerHeaderTableViewCell

- (void)awakeFromNib {
    [_avatarImageView circular];
    [_nameTextField bottomBorder:0.5 withColor:UIColorFromRGB(0xcccccc)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
