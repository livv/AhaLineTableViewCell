//
//  UITableViewCell+AhaLine.h
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

@import UIKit;

@interface UITableViewCell (AhaLine)

- (void)aha_setLineColor:(UIColor *)lineColor selectShowLine:(BOOL)selectShowLine;
- (void)aha_setLineColor:(UIColor *)lineColor;
- (void)aha_setLineHeight:(CGFloat)lineHeight;

- (void)aha_setLineLeftSpace:(CGFloat)leftSpace;
- (void)aha_setLineRightSpace:(CGFloat)rightSpace;

- (void)aha_setTopLineHidden:(BOOL)hidden;
- (void)aha_setBottomLineHidden:(BOOL)hidden;

@end
