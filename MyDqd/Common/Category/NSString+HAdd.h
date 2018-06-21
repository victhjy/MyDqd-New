//
//  NSString+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/11.
//  Copyright © 2017年 api. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JTTitle(x) [NSString titleIDFromNumber:(x)]


@interface NSString (HAdd)

@property(nonatomic, strong) NSURL *toUrl;


- (CGSize )sizeWithFont:(id )font maxSize:(CGSize)maxSize;

-(NSString *)RpNumberFormatter;

- (NSDate *)dateFromNormalFormat;

- (NSNumber *)toNumber;
- (NSString *)dateTransformNormal;
- (NSString *)dateTransToSplash;
+ (NSString *)titleFromNumber:(NSString *)num;
- (NSString *)countryNameFormatter;
+ (NSString *)titleIDFromNumber:(NSString *)num;
- (NSString *)yyyyMMdd_dateTransformNormal;
- (NSString *)bookingDateFormatter;
- (NSString *)http;
- (NSString *)htmlStrSizeToScreen;
@end
