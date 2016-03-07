//
//  UITableView+AhaLine.m
//  AhaLineTableViewCell
//
//  Created by haiwei on 3/7/16.
//  Copyright © 2016 livv. All rights reserved.
//

#import "UITableView+AhaLine.h"
#import "UITableViewCell+AhaLine.h"

@implementation UITableView (AhaLine)

- (void)configLineforCell:(UITableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *)indexPath
            withLeftSpace:(CGFloat)leftSpace {

    [self configLineforCell:cell
          forRowAtIndexPath:indexPath
              withLeftSpace:leftSpace
             hasSectionLine:YES];
}

- (void)configLineforCell:(UITableViewCell *)cell
        forRowAtIndexPath:(NSIndexPath *)indexPath
            withLeftSpace:(CGFloat)leftSpace
           hasSectionLine:(BOOL)hasSectionLine {
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {
        
        //只有一个cell，上长线&下长线
        [cell aha_setTopLineHidden:!hasSectionLine];
        [cell aha_setBottomLineHidden:NO];
        [cell aha_setLineLeftSpace:0];
        
    } else if (indexPath.row == 0) {
        
        //第一个cell，上长线&下短线
        [cell aha_setTopLineHidden:!hasSectionLine];
        [cell aha_setBottomLineHidden:NO];
        [cell aha_setLineLeftSpace:leftSpace];

    } else if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {
        
        //最后一个cell，下长线
        [cell aha_setTopLineHidden:YES];
        [cell aha_setBottomLineHidden:!hasSectionLine];
        [cell aha_setLineLeftSpace:hasSectionLine ? 0 : leftSpace];
        
    } else {
        
        //中间的cell，下短线
        [cell aha_setTopLineHidden:YES];
        [cell aha_setBottomLineHidden:NO];
        [cell aha_setLineLeftSpace:leftSpace];
    }
}

@end
