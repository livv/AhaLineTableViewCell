//
//  UITableView+AhaLine.h
//  AhaLineTableViewCell
//
//  Created by haiwei on 3/7/16.
//  Copyright © 2016 livv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AhaLine)

- (void)configLineforCell:(UITableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *)indexPath
            withLeftSpace:(CGFloat)leftSpace;

- (void)configLineforCell:(UITableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *)indexPath
            withLeftSpace:(CGFloat)leftSpace
           hasSectionLine:(BOOL)hasSectionLine;

@end
