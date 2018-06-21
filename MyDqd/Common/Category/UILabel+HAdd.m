//
//  UILabel+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import "UILabel+HAdd.h"

@implementation UILabel (HAdd)


+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor {
    UILabel *newLabel        = [[UILabel alloc] initWithFrame:frame];
    newLabel.backgroundColor = color==nil?[UIColor clearColor]:color;
    newLabel.text            = text;
    newLabel.textColor       = tColor;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font {
    UILabel *newLabel = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor];
    newLabel.font     = font==nil?[UIFont systemFontOfSize:15]:font;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font];
    newLabel.textAlignment = alignment;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame backColor:(UIColor *)color content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line {
    UILabel *newLabel      = [self buildLabelWithFrame:frame backColor:color content:text textColor:tColor font:font textAlignment:alignment];
    newLabel.numberOfLines = line;
    
    return newLabel;
}

+ (UILabel *)buildLabelWithFrame:(CGRect)frame content:(NSString *)text textColor:(UIColor *)tColor font:(UIFont *)font textAlignment:(NSTextAlignment)alignment lines:(NSInteger)line{
    return [UILabel buildLabelWithFrame:frame backColor:nil content:text textColor:tColor font:font textAlignment:alignment lines:line];
}

- (CGFloat)heightWithCurrentWidth:(CGFloat)currentWidth{
    CGSize size = [self.text sizeWithFont:self.font maxSize:CGSizeMake(currentWidth, 1000)];
    return size.height;
}
- (CGFloat)widthWithCurrentHeight:(CGFloat)curHeight{
    CGSize size = [self.text sizeWithFont:self.font maxSize:CGSizeMake(500, curHeight)];
    return size.width;
}

- (void)ha_calculateHeight {
    CGSize size = [self.text sizeWithFont:self.font maxSize:CGSizeMake(self.width, CGFLOAT_MAX)];
    self.height = size.height;
}

- (void)ha_calculateWidthSingleLine {
    CGSize size = [self.text sizeWithFont:self.font maxSize:CGSizeMake(CGFLOAT_MAX, 20)];
    self.width = size.width;
}

- (void)changeColorInRange:(NSRange)range withColor:(UIColor *)color {
    NSMutableAttributedString *muAttri = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [muAttri addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = muAttri;
}

- (void)ha_attriCalculateHeight{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)self.attributedText);
    CGSize suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), NULL, CGSizeMake(self.width, CGFLOAT_MAX), NULL);
    CFRelease(framesetter);
    self.height = suggestedSize.height;
}

- (void)ha_attriCalculateWidth{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)self.attributedText);
    CGSize suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), NULL, CGSizeMake(CGFLOAT_MAX, self.height), NULL);
    CFRelease(framesetter);
    self.width = suggestedSize.width;
}

/**
 显示当前文字需要几行
 
 @param width 给定一个宽度
 @return 返回行数
 */
- (NSInteger)needLinesWithWidth:(CGFloat)width{
    //创建一个labe
    UILabel * label = [[UILabel alloc]init];
    //font和当前label保持一致
    label.font = self.font;
    NSString * text = self.text;
    NSInteger sum = 0;
    //总行数受换行符影响，所以这里计算总行数，需要用换行符分隔这段文字，然后计算每段文字的行数，相加即是总行数。
    NSArray * splitText = [text componentsSeparatedByString:@"\n"];
    for (NSString * sText in splitText) {
        label.text = sText;
        //获取这段文字一行需要的size
        CGSize textSize = [label systemLayoutSizeFittingSize:CGSizeZero];
        //size.width/所需要的width 向上取整就是这段文字占的行数
        NSInteger lines = ceilf(textSize.width/width);
        //当是0的时候，说明这是换行，需要按一行算。
        lines = lines == 0?1:lines;
        sum += lines;
    }
    return sum;
}

@end
