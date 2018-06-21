//
//  UIButton+Hadd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/26.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonAction)(UIButton *b);
@interface UIButton (Hadd)

@property(nonatomic, copy) ButtonAction block;

- (void)addtargetForAction:(ButtonAction)block;
+(instancetype)buildBtnWitnFrame:(CGRect)frame andTitle:(NSString *)title TitleColor:(UIColor *)titleColor andTitleFont:(UIFont *)titleFont andBgColor:(UIColor *)bgColor andCornerRadius:(CGFloat)cornerRadius;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
