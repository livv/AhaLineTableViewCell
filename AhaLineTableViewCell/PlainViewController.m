//
//  PlainViewController.m
//  AhaLineTableViewCell
//
//  Created by haiwei on 3/7/16.
//  Copyright © 2016 livv. All rights reserved.
//

#import "PlainViewController.h"
#import "Common.h"
#import "TestTableViewCell.h"
#import "UITableView+AhaLine.h"
#import "UITableViewCell+AhaLine.h"

@interface PlainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * myTableView;

@end

@implementation PlainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITableViewStylePlain";
    
    // Do any additional setup after loading the view, typically from a nib.
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = UIColorFromHEX(0xfafafa);
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[TestTableViewCell nib] forCellReuseIdentifier:[TestTableViewCell cellIdentifier]];
        [self.view addSubview:tableView];
        tableView;
    });
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[TestTableViewCell cellIdentifier]
                                                               forIndexPath:indexPath];
    [cell setTitleStr:[NSString stringWithFormat:@"title %ld", (long)indexPath.row]];
    
    
    [cell aha_setLineColor:UIColorFromHEX(0xdddddd)];
    [cell aha_setLineRightSpace:10];
    [tableView configLineforCell:cell forRowAtIndexPath:indexPath withLeftSpace:20 hasSectionLine:NO];
    
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
