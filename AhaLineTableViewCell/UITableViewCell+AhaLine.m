//
//  UITableViewCell+AhaLine.m
//  AhaLineTableViewCell
//
//  Created by wei on 15/12/10.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "UITableViewCell+AhaLine.h"
#import <objc/runtime.h>
#import <Aspects/Aspects.h>

@interface UITableViewCell ()

@property (nonatomic, strong) UIView *ahaBottomLineView;
@property (nonatomic, assign) CGFloat bottomLineOffsetX;
@property (nonatomic, assign) CGFloat bottomLineRightOffsetX;
@property (nonatomic, assign) CGFloat bottomLineHeight;

@end


@implementation UITableViewCell (AhaLine)


#pragma mark - public

- (void)aha_setLineColor:(UIColor *)lineColor {
    
    [self aha_checkBottomLineView];
    self.ahaBottomLineView.backgroundColor = lineColor;
}

- (void)aha_setLineOffsetX:(CGFloat)offsetX {

    [self aha_checkBottomLineView];
    self.bottomLineOffsetX = offsetX;
}

- (void)aha_setLineRightOffsetX:(CGFloat)offsetX {
    
    [self aha_checkBottomLineView];
    self.bottomLineRightOffsetX = offsetX;
}

- (void)aha_setLineHeight:(CGFloat)height {

    [self aha_checkBottomLineView];
    self.bottomLineHeight = height;
}

- (void)aha_setLineHidden:(BOOL)hidden {
    
    [self aha_checkBottomLineView];
    self.ahaBottomLineView.hidden = hidden;
}


#pragma mark - private

- (void)aha_layoutSubviews {
    
    self.ahaBottomLineView.frame = CGRectMake(self.bottomLineOffsetX,
                                              self.bounds.size.height - self.bottomLineHeight,
                                              self.bounds.size.width - self.bottomLineOffsetX - self.bottomLineRightOffsetX,
                                              self.bottomLineHeight);
}

- (void)aha_checkBottomLineView {
    
    if (!self.ahaBottomLineView) {
        
        self.bottomLineOffsetX = 0.0f;
        self.bottomLineHeight = (1 / [UIScreen mainScreen].scale);
        
        self.ahaBottomLineView = [[UIView alloc] init];
        self.ahaBottomLineView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.ahaBottomLineView];
        
        [self aspect_hookSelector:@selector(layoutSubviews)
                      withOptions:AspectPositionAfter
                       usingBlock:^(id<AspectInfo>aspectInfo){
                           [self aha_layoutSubviews];
                       } error:NULL];
    }
}


#pragma mark- getters & setters

- (CGFloat)bottomLineOffsetX {
    return [objc_getAssociatedObject(self, @selector(bottomLineOffsetX)) floatValue];
}

- (void)setBottomLineOffsetX:(CGFloat)bottomLineOffsetX {
    objc_setAssociatedObject(self, @selector(bottomLineOffsetX), @(bottomLineOffsetX), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)bottomLineRightOffsetX {
    return [objc_getAssociatedObject(self, @selector(bottomLineRightOffsetX)) floatValue];
}

- (void)setBottomLineRightOffsetX:(CGFloat)bottomLineRightOffsetX {
    objc_setAssociatedObject(self, @selector(bottomLineRightOffsetX), @(bottomLineRightOffsetX), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)bottomLineHeight {
    return [objc_getAssociatedObject(self, @selector(bottomLineHeight)) floatValue];
}

- (void)setBottomLineHeight:(CGFloat)bottomLineHeight {
    objc_setAssociatedObject(self, @selector(bottomLineHeight), @(bottomLineHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ahaBottomLineView {
    return objc_getAssociatedObject(self, @selector(ahaBottomLineView));
}

- (void)setAhaBottomLineView:(UIView *)ahaBottomLineView {
    objc_setAssociatedObject(self, @selector(ahaBottomLineView), ahaBottomLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
