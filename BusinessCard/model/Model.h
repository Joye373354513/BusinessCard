//
//  Model.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/28.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSBusinessCardModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, strong) NSArray *phoneNumArray;
@property (nonatomic, strong) NSArray *companyInfoArray;
@property (nonatomic, strong) NSArray *emailArray;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, strong) NSArray *chatToolArray;
@property (nonatomic, strong) NSArray *additionArray;
@property (nonatomic, strong) NSArray *groupArray;
@end

@interface TSUserInfoModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNum;
@property (nonatomic, copy) NSString *avatar;
@end

