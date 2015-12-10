//
//  TestTableViewCell.h
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewCell : UITableViewCell

+ (UINib *)nib;
+ (NSString *)cellIdentifier;
- (void)config:(BOOL)hidden;

@end
