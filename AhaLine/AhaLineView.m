//
//  AhaLineView.m
//  AhaLineTableViewCell
//
//  Created by wei on 2016/10/27.
//  Copyright © 2016年 livv. All rights reserved.
//

#import "AhaLineView.h"

@implementation AhaLineView


- (void)drawRect:(CGRect)rect {
    
    if (self.bgColor) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.bgColor set];
        CGContextFillRect(context, rect);
    }
}

@end
