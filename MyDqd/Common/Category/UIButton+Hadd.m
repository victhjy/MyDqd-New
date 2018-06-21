//
//  UIButton+Hadd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/26.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIButton+Hadd.h"
#import <objc/runtime.h>

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;


@implementation UIButton (Hadd)

static char kHandlerBlockKey;

-(void)addtargetForAction:(ButtonAction)block{
    if (!self.block) {
        self.block = block;
    }
    
    [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClicked:(UIButton *)sender {
    if (self.block) {
        self.block(self);
    }
}

- (void)setBlock:(ButtonAction)block {
    objc_setAssociatedObject(self, &kHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

-(ButtonAction)block{
    return objc_getAssociatedObject(self, &kHandlerBlockKey);
}

+(instancetype)buildBtnWitnFrame:(CGRect)frame andTitle:(NSString *)title TitleColor:(UIColor *)titleColor andTitleFont:(UIFont *)titleFont andBgColor:(UIColor *)bgColor andCornerRadius:(CGFloat)cornerRadius{
    
    if (!titleColor) {
        titleColor = kBlackColor;
    }
    if (!bgColor) {
        bgColor = kWhiteColor;
    }
    if (!titleFont) {
        titleFont = DQFontR(14);
    }
    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bgColor];
    btn.titleLabel.font = titleFont;
    if (cornerRadius > 0) {
        btn.layer.cornerRadius = cornerRadius;
        btn.layer.masksToBounds = YES;
    }
    
    return btn;
}


- (void) setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect) enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


@end
