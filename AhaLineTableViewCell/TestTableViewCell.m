//
//  TestTableViewCell.m
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UITableViewCell+AhaLine.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    //一次性设置
    [self aha_setLineColor:[UIColor colorWithRed:(arc4random() % 255) / 255.0f
                                           green:(arc4random() % 255) / 255.0f
                                            blue:(arc4random() % 255) / 255.0f alpha:1.0]];
    [self aha_setLineOffsetX:arc4random() % 10 * 5];
    [self aha_setLineHeight:(arc4random() % 3 + 1) * (1 / [UIScreen mainScreen].scale)];
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

- (void)config:(BOOL)hidden {
    
    //动态设置
    [self aha_setLineColor:[UIColor colorWithRed:(arc4random() % 255) / 255.0f
                                           green:(arc4random() % 255) / 255.0f
                                            blue:(arc4random() % 255) / 255.0f alpha:1.0]];
    [self aha_setLineOffsetX:arc4random() % 10 * 5];
    [self aha_setLineHeight:(arc4random() % 3 + 1) * (1 / [UIScreen mainScreen].scale)];
    [self aha_setLineRightOffsetX:arc4random() % 10 * 5];
    [self aha_setLineHidden:hidden];
}

@end
