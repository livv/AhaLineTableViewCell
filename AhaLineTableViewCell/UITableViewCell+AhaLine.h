//
//  UITableViewCell+AhaLine.h
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

@import UIKit;

@interface UITableViewCell (AhaLine)

- (void)aha_setLineColor:(UIColor *)lineColor;

- (void)aha_setLineOffsetX:(CGFloat)offsetX;

- (void)aha_setLineHeight:(CGFloat)height;

- (void)aha_setLineHidden:(BOOL)hidden;

@end
