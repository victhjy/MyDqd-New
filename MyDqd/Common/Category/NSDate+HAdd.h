//
//  NSDate+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/11/25.
//  Copyright © 2017年 api. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HAdd)


+(NSString *)todayEEE_DDMMYYYY;
+(NSString *)tomorrowEEE_DDMMYYYY;
+(NSDate *)tomorrowDay;

-(NSString *)formatterWithEEEEE_D_MMMMM_YYYY;
+ (NSString *)dateWeekWithDate:(NSDate *)paramDate;
+ (NSString *)monthStr:(NSString *)index;
+ (NSString *)monthMMMStr:(NSString *)index;

//Tue,19 Aug
- (NSString *)EEE_DD_MMM;

- (NSString *)dateStrAfter:(NSInteger)days;

//Tue,19 Aug 2018
- (NSString *)EEE_DD_MMM_yyyy;
// Tue
+ (NSString *)dateEEEWeekWithDate:(NSDate *)paramDate;

+ (NSString *)headerDate;
- (NSString *)normalYYYY_MM_ddDate;
- (NSString *)normalHH_MMDate;
- (NSString *)dd_MMM_YYYY;
- (NSString *)dd_MMMMMMMM_YYYY;
-(NSDate *)tomorrowDay;
- (NSString *)MMmonthDate;
- (NSString *)HHhourDate;

- (NSString *)ddmmYYYYWithSlash;
- (NSString *)yyyyMMddTHHmmss;
- (NSDate *)dateAfter:(NSInteger)days;
+ (NSDate *)ssssZToDate:(NSString *)dateStr;
// 1:周日  7:周六
- (NSInteger)weekInt;

+(NSString *)curMonth;
+(NSString *)nextMonth;

//下x个月的月底那天日期
-(NSDate *)getLastDateAfter:(NSInteger)monthNum;
@end
