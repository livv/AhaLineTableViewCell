//
//  ViewController.m
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "GroupViewController.h"
#import "TestTableViewCell.h"
#import "UITableViewCell+AhaLine.h"
#import "UITableView+AhaLine.h"
#import "Common.h"


@interface GroupViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * mainTable;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UITableViewStyleGrouped";
    
    // Do any additional setup after loading the view, typically from a nib.
    _mainTable = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = UIColorFromHEX(0xeeeeee);
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[TestTableViewCell nib] forCellReuseIdentifier:[TestTableViewCell cellIdentifier]];
        [self.view addSubview:tableView];
        tableView;
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        default:
            return 1;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[TestTableViewCell cellIdentifier]
                                                               forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            [cell setTitleStr:@"账号设置"];
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    [cell setTitleStr:@"意见反馈"];
                    break;
                case 1:
                    [cell setTitleStr:@"去评分"];
                    break;
                default:
                    [cell setTitleStr:@"分享给好友"];
                    break;
            }
            break;
        default:
            [cell setTitleStr:@"关于Coding"];
            break;
    }
    
    [cell aha_setLineColor:UIColorFromHEX(0xdddddd)];
    [tableView configLineforCell:cell forRowAtIndexPath:indexPath withLeftSpace:20];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    headerView.backgroundColor = UIColorFromHEX(0xeeeeee);
    return headerView;
}

@end
