//
//  TestTableViewCell.m
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UITableViewCell+AhaLine.h"
#import "Common.h"

@interface TestTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel * titleLabel;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor = UIColorFromHEX(0xfafafa);
    [self aha_setLineColor:UIColorFromHEX(0xdddddd)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - public

+ (UINib *)nib {
    return [UINib nibWithNibName:[TestTableViewCell cellIdentifier] bundle:nil];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([TestTableViewCell class]);
}

- (void)setTitleStr:(NSString *)title {

    self.titleLabel.text = title;
}

@end
