//
//  BusinesspartnerEditViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/31.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"

@interface BusinesspartnerEditViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *phoneNumArray;
@property (strong, nonatomic) NSMutableArray *emailArray;
@property (strong, nonatomic) NSMutableArray *companyArray;
@property (strong, nonatomic) NSMutableArray *addressArray;
@property (strong, nonatomic) NSMutableArray *chatToolsArray;
@property (strong, nonatomic) NSMutableArray *birthdayArray;
@property (strong, nonatomic) NSMutableDictionary *infoDic;
@end
