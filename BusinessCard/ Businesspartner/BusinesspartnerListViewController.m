//
//  BusinesspartnerListViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/27.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BusinesspartnerListViewController.h"
#import "BusinesspartnerEditViewController.h"

@interface BusinesspartnerListViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BusinesspartnerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"名片夹";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _nameArray = [[NSMutableArray alloc]init];
    _dataDic = [[NSMutableDictionary alloc]init];
    [_nameArray addObjectsFromArray:[NSArray arrayWithObjects:@"￥hhh",@" ￥Chin ese ",@"开源中国",@"www.oschina.net",
                                     @"开源技术",@"社区",@"开发者",@"传播",
                                     @"2014",@"2013",@"100",@"中国",@"暑假作业",
                                     @"键盘", @"鼠标",@"hello",@"world",
                                     nil]];
    [self getDic];
    _initialArray = [[_dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _tableView.sectionIndexColor = [UIColor blackColor];
    self.searchDisplayController.searchBar.placeholder = @"搜索";
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPeople)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*!
 *  @brief  跳转到填写/编辑个人信息界面
 */
- (void)addPeople
{
    BusinesspartnerEditViewController *vc = [[BusinesspartnerEditViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Section header view
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth, 20)];
    bgView.backgroundColor = UIColorFromRGB(0xeeeeee);
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, MainScreenWidth - 20 , 20)];
    lab.text = [_initialArray objectAtIndex:section];
    lab.textColor = [UIColor blackColor];
    lab.font = [UIFont systemFontOfSize:16];
    [bgView addSubview:lab];
    return bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _initialArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_initialArray count];
}

#pragma mark -设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self getNameArraybyIndex:section].count;
}

#pragma mark -每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]) {
        
    }
    else {
        cell.textLabel.text = [[self getNameArraybyIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)searchDisplayControllerWillBeginSearch:(UISearchController *)controller{
    self.searchDisplayController.searchBar.showsCancelButton = YES;
    UIButton *cancelButton;
    UIView *topView = self.searchDisplayController.searchBar.subviews[0];
    for (UIView *subView in topView.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            cancelButton = (UIButton*)subView;
        }
    }
    if (cancelButton) {
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    }
}

- (BOOL) searchDisplayController:(UISearchController *)controller
shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return YES;
}

#pragma mark - Select内容为数组相应索引的值
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
//                                                    message:[[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
//                                                   delegate:nil
//                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
//    [alert show];
//}

/*!
 *  @brief  获得对应首字母下的名字
 *
 *  @param index 第几个section
 *
 *  @return 名字数组
 */
- (NSArray *)getNameArraybyIndex:(NSInteger)index
{
    NSMutableArray *nameArray = [[NSMutableArray alloc]init];
    NSArray *tempArray = [_dataDic objectForKey:_initialArray[index]];
    for (int i = 0; i < tempArray.count; i ++) {
        NSString *name = [tempArray[i] objectForKey:@"name"];
        [nameArray addObject:name];
    }
    return nameArray;
}

/*!
 *  @brief  取汉字拼音的首字母,如果不是字母，则返回#
 *
 *  @param aString 名字
 *
 *  @return 首字母
 */
- (NSString *)firstCharactor:(NSString *)aString
{
    //转化为大写拼音
    NSString *pinYin = [[self changeToPinyin:aString] capitalizedString];
    //获取并返回首字母
    NSString *initialStr = [pinYin substringToIndex:1];
    char asc = [initialStr characterAtIndex:0];
    if (asc >= 'A' && asc <= 'Z') {
        return initialStr;
    }
    else {
        return @"#";
    }
}

/*!
 *  @brief  中文转拼音
 *
 *  @param aString 中文
 *
 *  @return 拼音
 */
- (NSString *)changeToPinyin:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    return str;
}

/*!
 *  @brief  给首字母一样的名字排序
 */
- (void)getDic
{
    NSMutableArray *tempArray = [NSMutableArray new];
    for (int i = 0; i < _nameArray.count; i ++) {
        NSMutableDictionary *tempDic= [NSMutableDictionary new];
        NSString *initialStr = [self firstCharactor:_nameArray[i]];
        tempArray = [_dataDic objectForKey:initialStr];
        if (tempArray == nil) {
            tempArray = [NSMutableArray new];
            [tempDic setValue:_nameArray[i] forKey:@"name"];
            [tempDic setValue:[self changeToPinyin:_nameArray[i]] forKey:@"pinyin"];
            [tempArray addObject:tempDic];
        }
        else {
            [tempDic setValue:_nameArray[i] forKey:@"name"];
            [tempDic setValue:[self changeToPinyin:_nameArray[i]] forKey:@"pinyin"];
            [tempArray addObject:tempDic];
        }
        [_dataDic setObject:tempArray forKey:initialStr];
    }
    for (NSString *key in [_dataDic allKeys]) {
        NSArray *oldArray = [_dataDic objectForKey:key];
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinyin" ascending:YES]];
        NSArray *sortArray = [oldArray sortedArrayUsingDescriptors:sortDescriptors];
        [_dataDic setValue:sortArray forKey:key];
    }
}
@end
