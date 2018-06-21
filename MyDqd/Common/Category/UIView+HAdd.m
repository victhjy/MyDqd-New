//
//  UIView+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UIView+HAdd.h"
#import <objc/runtime.h>
#import "UIView+Toast.h"

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;

static char kActionHandlerTapTimeBlockKey;
static char kActionHandlerTapTimeGestureKey;

static char kActionHandlerPanBlockKey;
static char kActionHandlerPanGestureKey;
@implementation UIView (HAdd)


- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - normal click

- (void)addTapActionWithBlock:(GestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

#pragma mark - timeClick

- (void)addTapActionNeedClickTime:(NSInteger)tapTime WithBlock:(GestureActionBlock)block{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapTimeGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTimeTapGesture:)];
        gesture.numberOfTapsRequired = tapTime;
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerTapTimeGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapTimeBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTimeTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapTimeBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

#pragma mark - pan

- (void)addPanTapActionWithBlock:(GestureActionBlock)block {
    UIPanGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerPanGestureKey);
    if (!gesture)
    {
        gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForPanGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kActionHandlerPanGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerPanBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForPanGesture:(UIPanGestureRecognizer*)gesture
{
    //    if (gesture.state == UIGestureRecognizerStateRecognized)
    //    {
    GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerPanBlockKey);
    if (block)
    {
        block(gesture);
    }
    //    }
}


- (void)showTips:(NSString *)text {
    // create a new style
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    
    // this is just one of many style options
    style.messageColor = [UIColor whiteColor];
    style.verticalPadding = 10;
    style.backgroundColor = [UIColor colorWithHexString:@"629ad0"];
//    style.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:111.0/255.0 blue:188.0/255.0 alpha:0.8];
    // present the toast with the new style
    [self makeToast:text
           duration:1.5
           position:[NSValue valueWithCGPoint:CGPointMake(self.width/2, self.height - 110)]
              style:style];
    
}

- (void)showTips:(NSString *)text durationSeconds:(CGFloat)durationTime{
    if (durationTime <= 0) {
        durationTime = 1.5;
    }
    // create a new style
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    
    // this is just one of many style options
    style.messageColor = [UIColor whiteColor];
    style.verticalPadding = 10;
    style.backgroundColor = [UIColor colorWithHexString:@"629ad0"];
    //    style.backgroundColor = [UIColor colorWithRed:31.0/255.0 green:111.0/255.0 blue:188.0/255.0 alpha:0.8];
    // present the toast with the new style
    [self makeToast:text
           duration:durationTime
           position:[NSValue valueWithCGPoint:CGPointMake(self.width/2, self.height - 110)]
              style:style];
    
}

+ (RemovePopBlock)popView:(UIView *)customerV andCanTouchCancel:(BOOL)touchEnable {
    UIView *bgV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; // 0.3
    __weak __typeof(UIView)*weakBg = bgV;
    
    customerV.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:bgV];
    [[UIApplication sharedApplication].keyWindow addSubview:customerV];
    
    customerV.center = CGPointMake(kWidth/2, kHeight/2);
    
    [UIView animateWithDuration:0.2 animations:^{
        bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // 0.3
        customerV.alpha = 1;
    }];

    
    void (^RemoveBlock)(void)= ^{
        [weakBg removeFromSuperview];
        
        [UIView animateWithDuration:0.2 animations:^{
            customerV.alpha = 0;

        } completion:^(BOOL finished) {
            [customerV removeFromSuperview];

        }];
    };
    if (touchEnable) {
        [bgV addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            RemoveBlock();
        }];
    }
    return RemoveBlock;
}

+ (RemovePopBlock)popView:(UIView *)customerV andCanTouchCancel:(BOOL)touchEnable doneHandler:(void(^)(void))handler{
    UIView *bgV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; // 0.3
    __weak __typeof(UIView)*weakBg = bgV;
    
    customerV.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:bgV];
    [[UIApplication sharedApplication].keyWindow addSubview:customerV];
    
    customerV.center = CGPointMake(kWidth/2, kHeight/2);
    
    [UIView animateWithDuration:0.2 animations:^{
        bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // 0.3
        customerV.alpha = 1;
    }];
    
    
    void (^RemoveBlock)(void)= ^{
        [weakBg removeFromSuperview];
        [customerV removeFromSuperview];
        if (handler) {
            handler();
        }
    };
    if (touchEnable) {
        [bgV addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            RemoveBlock();
        }];
    }
    return RemoveBlock;
}

+ (RemovePopBlock)animationTopPopView:(UIView *)customerV andCanTouchCancel:(BOOL)touchEnable andOriH:(CGFloat)oriH {
    UIView *bgV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; // 0.3
    __weak __typeof(UIView)*weakBg = bgV;
    
    customerV.alpha = 1;
    [[UIApplication sharedApplication].keyWindow addSubview:bgV];
    
    UIView *bgV1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, customerV.top)];
    bgV1.backgroundColor = bgV.backgroundColor;
    [bgV addSubview:bgV1];
    
    [bgV1 addSubview:customerV];
    bgV1.clipsToBounds = YES;
//     [[UIApplication sharedApplication].keyWindow bringSubviewToFront:customerV];
//    customerV.center = CGPointMake(kWidth/2, kHeight/2);
    
    [UIView animateWithDuration:0.2 animations:^{
        bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // 0.3
//        customerV.transform = CGAffineTransformMakeScale(1.0, 1);
        customerV.top -= oriH;
    } completion:^(BOOL finished) {
        
    }];
    
    
    void (^RemoveBlock)(void)= ^{
        
        [UIView animateWithDuration:0.2 animations:^{
            customerV.top = customerV.bottom;
//            customerV.transform = CGAffineTransformMakeScale(1.0, 0.1);
        } completion:^(BOOL finished) {
            [customerV removeFromSuperview];
            [weakBg removeFromSuperview];

            
        }];
    };
    if (touchEnable) {
        [bgV addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            RemoveBlock();
        }];
    }
    return RemoveBlock;
}

+ (RemovePopBlock)animationBottomPopView:(UIView *)customerV andCanTouchCancel:(BOOL)touchEnable andOriH:(CGFloat)oriH {
    UIView *bgV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0]; // 0.3
    __weak __typeof(UIView)*weakBg = bgV;
    
    customerV.alpha = 1;
    [[UIApplication sharedApplication].keyWindow addSubview:bgV];
    CGFloat oriZero = customerV.bottom;
    UIView *bgV1 = [[UIView alloc] initWithFrame:CGRectMake(0, oriZero, kWidth, kHeight - customerV.bottom)];
    customerV.top = customerV.top - oriZero;
    bgV1.backgroundColor = bgV.backgroundColor;
    bgV1.clipsToBounds = YES;
    [bgV addSubview:bgV1];
    
    [bgV1 addSubview:customerV];
    
    [UIView animateWithDuration:0.2 animations:^{
        customerV.top += oriH;
        
        bgV.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3]; // 0.3
    }];
    
    
    void (^RemoveBlock)(void)= ^{
        
        [UIView animateWithDuration:0.2 animations:^{
            customerV.top -= oriH;
            
        } completion:^(BOOL finished) {
            [customerV removeFromSuperview];
            [weakBg removeFromSuperview];

            
        }];
    };
    if (touchEnable) {
        [bgV addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            RemoveBlock();
        }];
    }
    return RemoveBlock;
}

@end
