//
//  NSString+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import "NSString+HAdd.h"

@implementation NSString (HAdd)

- (CGSize)sizeWithFont:(id )font maxSize:(CGSize)maxSize
{
    UIFont *f;
    if ([font isKindOfClass:[UIFont class]]) {
        f = font;
    }
    else{
        CGFloat fontNum = [font floatValue];
        f = [UIFont systemFontOfSize:fontNum];
    }
    NSDictionary *attrs = @{NSFontAttributeName : f};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


-(NSString *)RpNumberFormatter{
    BOOL isNegative = NO;
    NSString *text = self;
    if ([[self substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"-"]) {
        text= [text substringFromIndex:1];
        isNegative = YES;
    }
    if(!text || [text floatValue] == 0){
        return @"0";
    }
    if (text.floatValue < 1000) {
        return  [NSString stringWithFormat:@"%ld",(long)text.integerValue];
    };
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setUsesGroupingSeparator:YES];
    [numberFormatter setGroupingSize:3];
    [numberFormatter setGroupingSeparator:@"."];
    
    NSString *result =[numberFormatter stringFromNumber:[NSNumber numberWithDouble:[text doubleValue]]];
    if (isNegative) {
        return [NSString stringWithFormat:@"-Rp%@",result];
    }
    else{
        return [NSString stringWithFormat:@"Rp%@",result];
    }
}

- (NSDate *)dateFromNormalFormat{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *date = [f dateFromString:self];
    return date;
}

- (NSNumber *)toNumber{
    if (self.length < 1) {
        return @0;
    }
    NSInteger integer = [self integerValue];
    return [NSNumber numberWithInteger:integer];
}

- (NSString *)dateTransformNormal{
    if (self.length < 1) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *d = [f dateFromString:self];
    
    return [d dd_MMMMMMMM_YYYY];
}

- (NSString *)yyyyMMdd_dateTransformNormal{
    if (self.length < 1) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [f dateFromString:self];
    
    return [d dd_MMMMMMMM_YYYY];
}

- (NSString *)dateTransToSplash{
    if (self.length < 1) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [f dateFromString:self];
    
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    f2.dateFormat = @"dd/MM/yyyy";
    NSString *resultStr = [f2 stringFromDate:d];
    return resultStr;
}

+(NSString *)titleFromNumber:(NSString *)num{
    if (num.length > 1) {
        return num;
    }
    else{
        if ([num isEqualToString:@"0"]) {
            return L(@"Mr.");
        }
        else if ([num isEqualToString:@"1"]){
            return L(@"Mrs.");
        }
        else if ([num isEqualToString:@"2"]){
            return L(@"MS.");
        }
        else if ([num isEqualToString:@"3"]){
            return L(@"MSTR.");
        }
        else if ([num isEqualToString:@"4"]){
            return L(@"MISS.");
        }
        else{
            return L(@"Mr.");
        }
    }
}

+(NSString *)titleIDFromNumber:(NSString *)num{
    if ([num isEqualToString:@"0"]) {
        return L(@"MR");
    }
    else if ([num isEqualToString:@"1"]){
        return L(@"MRS");
    }
    else if ([num isEqualToString:@"2"]){
        return L(@"MS");
    }
    else if ([num isEqualToString:@"3"]){
        return L(@"MSTR");
    }
    else if ([num isEqualToString:@"4"]){
        return L(@"MISS");
    }
    else{
        return L(@"MR");
    }
}

- (NSString *)countryNameFormatter{
    NSInteger secondIndex = 0;
    for (int i = 0; i<self.length; i++) {
        char commitChar = [self characterAtIndex:i];
        NSString *temp = [self substringWithRange:NSMakeRange(i,1)];
        
        const char *u8Temp = [temp UTF8String];
        if(i != 0 && (commitChar>64)&&(commitChar<91)){
            NSString *tempLastChar = [self substringWithRange:NSMakeRange(i-1,1)];
            if (![tempLastChar isEqualToString:@" "] && ![tempLastChar isEqualToString:@"."]) {
                secondIndex = i;
                break;
            }
        }
    }
    
    if (secondIndex != 0) {
        NSMutableString *mustr = [NSMutableString stringWithString:self];
        [mustr insertString:@" " atIndex:secondIndex];
        return [mustr copy];
    }
    else{
        return self;
    }
}

- (NSString *)bookingDateFormatter{
    if (self.length < 1) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *d = [f dateFromString:self];
    
    return [d EEE_DD_MMM_yyyy];
}

- (NSURL *)toUrl{
    return [NSURL URLWithString:self];
}

- (void)setToUrl:(NSURL *)toUrl {
    
}

- (NSString* )http {
    return [NSString stringWithFormat:@"http://%@",self];
}

- (NSString *)htmlStrSizeToScreen{
    NSString *head =@"<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"> <style>img{max-width: 100%; width:auto; height:auto;}</style></head>";
    NSString *head1 = [NSString stringWithFormat:@"<html>%@<body>%@</body><html>",head,self];
    return head1;
}

@end
