//
//  BusinesspartnerEditViewController.m
//  BusinessCard
//
//  Created by tom.sun on 15/8/31.
//  Copyright (c) 2015年 tom.sun. All rights reserved.
//

#import "BusinesspartnerEditViewController.h"
#import "BusinesspartnerHeaderTableViewCell.h"

@interface BusinesspartnerEditViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BusinesspartnerEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _phoneNumArray = [[NSMutableArray alloc]init];
    _emailArray = [[NSMutableArray alloc]init];
    _companyArray = [[NSMutableArray alloc]init];
    _birthdayArray = [[NSMutableArray alloc]init];
    _addressArray = [[NSMutableArray alloc]init];
    _chatToolsArray = [[NSMutableArray alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"BusinesspartnerHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIdentifier"];
    _infoDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:_phoneNumArray,@"1",_emailArray,@"2",_companyArray,@"3",_birthdayArray,@"5",_addressArray,@"6",_chatToolsArray,@"7", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 4) {
        return 1;
    }
    if (section == 1) {
        return _phoneNumArray.count + 1;
    }
    if (section == 2) {
        return _emailArray.count + 1;
    }
    if (section == 3) {
        return _companyArray.count + 1;
    }
    if (section == 5) {
        return _birthdayArray.count + 1;
    }
    if (section == 6) {
        return _addressArray.count + 1;
    }
    if (section == 7) {
        return _chatToolsArray.count + 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell2)
    {
        cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, 34, MainScreenWidth - 15, 0.5)];
    line.backgroundColor = UIColorFromRGB(0xcccccc);
    [cell2.contentView addSubview:line];
    if (indexPath.section == 0) {
        BusinesspartnerHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
        return cell;
    }
    if (indexPath.section == 1 ) {
        if (indexPath.row == _phoneNumArray.count) {
            cell2.textLabel.text = @"添加电话";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"电话";
            for (int i = 0; i < _phoneNumArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",([_phoneNumArray[i] allKeys])[0]];
            }
        }
        return cell2;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == _emailArray.count) {
            cell2.textLabel.text = @"添加电子邮件";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"电子邮件";
            for (int i = 0; i < _emailArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",[(_emailArray[i]) allKeys][0]];
            }
        }
        return cell2;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == _companyArray.count) {
            cell2.textLabel.text = @"添加公司信息";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"公司信息";
            for (int i = 0; i < _companyArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",[(_companyArray[i]) allKeys][0]];
            }
        }
        return cell2;
    }
    if (indexPath.section == 4) {
        cell2.textLabel.text = @"分组";
        cell2.detailTextLabel.text = @"未分组";
        return cell2;
    }
    if (indexPath.section == 5) {
        if (indexPath.row == _birthdayArray.count) {
            cell2.textLabel.text = @"添加生日";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"生日";
            for (int i = 0; i < _birthdayArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",[(_birthdayArray[i]) allKeys][0]];
            }
        }
        return cell2;
    }
    if (indexPath.section == 6) {
        if (indexPath.row == _addressArray.count) {
            cell2.textLabel.text = @"添加地址";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"地址";
            for (int i = 0; i < _addressArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",[(_addressArray[i]) allKeys][0]];
            }
        }
        return cell2;
    }
    if (indexPath.section == 7) {
        if (indexPath.row == _chatToolsArray.count) {
            cell2.textLabel.text = @"添加即时聊天信息";
            cell2.imageView.image = [UIImage imageNamed:@"addBtn"];
        }
        else {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 0.5, 35)];
            line.backgroundColor = UIColorFromRGB(0xcccccc);
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(line.originX + 10, 0, MainScreenWidth - line.originX - 10, 35)];
            [textField setBorderStyle:UITextBorderStyleNone];
            [cell2.contentView addSubview:line];
            [cell2.contentView addSubview:textField];
            textField.placeholder = @"账号";
            for (int i = 0; i < _chatToolsArray.count; i ++) {
                cell2.textLabel.text = [NSString stringWithFormat:@"%@",[(_chatToolsArray[i]) allKeys][0]];
            }
        }
        return cell2;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 65;
    }
    else {
        return 35;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        if (indexPath.row == _phoneNumArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            NSMutableArray *allPhoneTypeArray =[[NSMutableArray alloc]init];
            NSMutableArray *phoneTypeArray = [[NSMutableArray alloc]init];
            if (_phoneNumArray.count > 0) {
                for (int i = 0; i < _phoneNumArray.count; i ++) {
                    [allPhoneTypeArray addObject:[_phoneNumArray[i] allKeys][0]];
                }
                if (![allPhoneTypeArray containsObject:@"手机号码"]) {
                    [phoneTypeArray addObject:@"手机号码"];
                }
                else if (![allPhoneTypeArray containsObject:@"住宅电话"]) {
                    [phoneTypeArray addObject:@"住宅电话"];
                }
                else {
                    [phoneTypeArray addObject:@"家庭电话"];
                }
                [_phoneNumArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:phoneTypeArray[0]]];
            }
            else {
                [_phoneNumArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"手机号码"]];
            }
            if (_phoneNumArray.count <= 3) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == _emailArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            if (_emailArray.count > 0) {
                [_emailArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"公司邮箱"]];
            }
            else {
                [_emailArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"个人邮箱"]];
            }
            if (_emailArray.count <= 2) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == _companyArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            NSLog(@"row = %ld, section = %ld ",(long)indexPath.row,(long)indexPath.section);
            NSMutableArray *allJobInfoArray =[[NSMutableArray alloc]init];
            NSMutableArray *jobInfoArray = [[NSMutableArray alloc]init];
            if (_companyArray.count > 0) {
                for (int i = 0; i < _companyArray.count; i ++) {
                    [allJobInfoArray addObject:[_companyArray[i] allKeys][0]];
                }
                if (![allJobInfoArray containsObject:@"公司"]) {
                    [jobInfoArray addObject:@"公司"];
                }
                else if (![allJobInfoArray containsObject:@"部门"]) {
                    [jobInfoArray addObject:@"部门"];
                }
                else {
                    [jobInfoArray addObject:@"职位"];
                }
                [_companyArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:jobInfoArray[0]]];
            }
            else {
                [_companyArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"公司"]];
            }
            if (_companyArray.count <= 3) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
    if (indexPath.section == 5) {
        if (indexPath.row == _birthdayArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            if (_birthdayArray.count > 0) {
                [_birthdayArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"阳历生日"]];
            }
            else {
                [_birthdayArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"农历生日"]];
            }
            if (_birthdayArray.count <= 2) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
    if (indexPath.section == 6) {
        if (indexPath.row == _addressArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            if (_addressArray.count > 0) {
                [_addressArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"公司地址"]];
            }
            else {
                [_addressArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"住宅地址"]];
            }
            if (_addressArray.count <= 2) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
    if (indexPath.section == 7) {
        if (indexPath.row == _chatToolsArray.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            if (_chatToolsArray.count > 0) {
                [_chatToolsArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"微信"]];
            }
            else {
                [_chatToolsArray addObject:[NSDictionary dictionaryWithObject:@"" forKey:@"QQ"]];
            }
            if (_chatToolsArray.count <= 2) {
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == _phoneNumArray.count) {
            return UITableViewCellEditingStyleNone;
        }
        else {
            return UITableViewCellEditingStyleDelete;
        }
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainScreenWidth, 30)];
    bgView.backgroundColor = [UIColor whiteColor];
    return bgView;
}
@end
