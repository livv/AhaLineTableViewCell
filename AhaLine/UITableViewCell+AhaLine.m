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
#import "AhaLineView.h"

@interface UITableViewCell ()

@property (nonatomic, strong) AhaLineView *ahaBottomLineView;
@property (nonatomic, strong) AhaLineView *ahaTopLineView;

@property (nonatomic, assign) CGFloat ahaLeftSpace;
@property (nonatomic, assign) CGFloat ahaRightSpace;
@property (nonatomic, assign) CGFloat ahaLineHeight;

@end


@implementation UITableViewCell (AhaLine)


#pragma mark - public

- (void)aha_setLineColor:(UIColor *)lineColor selectShowLine:(BOOL)selectShowLine {
    
    [self aha_checkBottomLineView];
    
    if (selectShowLine) {
        self.ahaBottomLineView.bgColor = lineColor;
        self.ahaTopLineView.bgColor = lineColor;
    } else {
        self.ahaTopLineView.bgColor = nil;
        self.ahaBottomLineView.backgroundColor = lineColor;
        self.ahaTopLineView.backgroundColor = lineColor;
    }
}

- (void)aha_setLineColor:(UIColor *)lineColor {
    
    [self aha_setLineColor:lineColor selectShowLine:NO];
}


- (void)aha_setLineHeight:(CGFloat)lineHeight {
    
    [self aha_checkBottomLineView];
    self.ahaLineHeight = lineHeight;
}

- (void)aha_setLineLeftSpace:(CGFloat)leftSpace {
    
    [self aha_checkBottomLineView];
    self.ahaLeftSpace = leftSpace;
}

- (void)aha_setLineRightSpace:(CGFloat)rightSpace {
    
    [self aha_checkBottomLineView];
    self.ahaRightSpace = rightSpace;
}

- (void)aha_setTopLineHidden:(BOOL)hidden {
    
    [self aha_checkBottomLineView];
    self.ahaTopLineView.hidden = hidden;
}

- (void)aha_setBottomLineHidden:(BOOL)hidden {
   
    [self aha_checkBottomLineView];
    self.ahaBottomLineView.hidden = hidden;
}


#pragma mark - private

- (void)aha_layoutSubviews {
    
    self.ahaTopLineView.frame = CGRectMake(0,
                                           0,
                                           self.bounds.size.width,
                                           self.ahaLineHeight);
    
    self.ahaBottomLineView.frame = CGRectMake(self.ahaLeftSpace,
                                              self.bounds.size.height - self.ahaLineHeight,
                                              self.bounds.size.width - self.ahaLeftSpace - self.ahaRightSpace,
                                              self.ahaLineHeight);
    
}

- (void)aha_checkBottomLineView {
    
    if (!self.ahaBottomLineView) {
        
        self.ahaLeftSpace = 0.0f;
        self.ahaLineHeight = (1 / [UIScreen mainScreen].scale);
        
        self.ahaBottomLineView = [[AhaLineView alloc] init];
        self.ahaBottomLineView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.ahaBottomLineView];
        
        self.ahaTopLineView = [[AhaLineView alloc] init];
        self.ahaTopLineView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.ahaTopLineView];
        self.ahaTopLineView.hidden = YES;
        
        [self aspect_hookSelector:@selector(layoutSubviews)
                      withOptions:AspectPositionAfter
                       usingBlock:^(id<AspectInfo>aspectInfo){
                           [self aha_layoutSubviews];
                       } error:NULL];
    }
}


#pragma mark- getters & setters

- (CGFloat)ahaLeftSpace {
    return [objc_getAssociatedObject(self, @selector(ahaLeftSpace)) floatValue];
}

- (void)setAhaLeftSpace:(CGFloat)ahaLeftSpace {
    objc_setAssociatedObject(self, @selector(ahaLeftSpace), @(ahaLeftSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)ahaRightSpace {
    return [objc_getAssociatedObject(self, @selector(ahaRightSpace)) floatValue];
}

- (void)setAhaRightSpace:(CGFloat)ahaRightSpace {
    objc_setAssociatedObject(self, @selector(ahaRightSpace), @(ahaRightSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)ahaLineHeight {
    return [objc_getAssociatedObject(self, @selector(ahaLineHeight)) floatValue];
}

- (void)setAhaLineHeight:(CGFloat)ahaLineHeight {
    objc_setAssociatedObject(self, @selector(ahaLineHeight), @(ahaLineHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ahaBottomLineView {
    return objc_getAssociatedObject(self, @selector(ahaBottomLineView));
}

- (void)setAhaBottomLineView:(UIView *)ahaBottomLineView {
    objc_setAssociatedObject(self, @selector(ahaBottomLineView), ahaBottomLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ahaTopLineView {
    return objc_getAssociatedObject(self, @selector(ahaTopLineView));
}

- (void)setAhaTopLineView:(UIView *)ahaTopLineView {
    objc_setAssociatedObject(self, @selector(ahaTopLineView), ahaTopLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
