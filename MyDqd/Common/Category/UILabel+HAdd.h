//
//  UILabel+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TextClickedBlock)(void);

@interface UILabel (HAdd)

/**
 *  创建Label 默认左对齐 不换行 系统字号
 *
 *  @param frame frame
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *
 *  @return label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor;

/**
 *  创建Label 默认左对齐 不换行
 *
 *  @param frame  frame
 *  @param color  背景色 默认 透明
 *  @param text   内容
 *  @param tColor 内容颜色 默认 黑色
 *  @param font   字号 默认 15
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font;

/**
 *  创建Label 默认不换行
 *
 *  @param frame     frame
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号  默认 15
 *  @param alignment 对齐方式  默认 左对齐
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;

/**
 *  创建Label
 *
 *  @param frame     frame
 *  @param color     背景色 默认 透明
 *  @param text      内容
 *  @param tColor    内容颜色 默认 黑色
 *  @param font      字号 默认 15
 *  @param alignment 对齐方式 默认 左对齐
 *  @param line      显示行数 默认 无限制
 *
 *  @return Label
 */
+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line;

+ (UILabel *)buildLabelWithFrame:(CGRect)frame content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line;


- (CGFloat)heightWithCurrentWidth:(CGFloat)curWidth;
- (CGFloat)widthWithCurrentHeight:(CGFloat)curHeight;

- (void)ha_calculateHeight;

- (void)ha_calculateWidthSingleLine;

- (void)ha_attriCalculateHeight;
- (void)ha_attriCalculateWidth;
- (NSInteger)needLinesWithWidth:(CGFloat)width;
@end
