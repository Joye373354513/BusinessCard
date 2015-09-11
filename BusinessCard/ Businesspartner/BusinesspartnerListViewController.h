//
//  BusinesspartnerListViewController.h
//  BusinessCard
//
//  Created by tom.sun on 15/8/27.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BaseViewController.h"

@interface BusinesspartnerListViewController : BaseViewController
@property (nonatomic, strong) NSArray *initialArray;//首字母
@property (nonatomic, strong) NSMutableArray *nameArray;//名字
@property (nonatomic, strong) NSMutableDictionary *dataDic;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) NSArray *filterArray;
@end
