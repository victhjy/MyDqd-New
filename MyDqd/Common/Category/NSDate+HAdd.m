//
//  NSDate+HAdd.m
//  JatraTour
//
//  Created by huangjinyang on 17/11/25.
//  Copyright © 2017年 api. All rights reserved.
//

#import "NSDate+HAdd.h"

@implementation NSDate (HAdd)


+(NSString *)todayEEE_DDMMYYYY{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"EEE,dd MM yyyy";
    return [f stringFromDate:[NSDate date]];
}

+(NSString *)tomorrowEEE_DDMMYYYY{
    NSTimeInterval secondsPerDay = 24*60*60;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"EEE,dd MM yyyy";
    return [f stringFromDate:tomorrow];
}

+(NSDate *)tomorrowDay{
    NSTimeInterval secondsPerDay = 24*60*60;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    return tomorrow;
}

-(NSDate *)tomorrowDay{
    NSTimeInterval secondsPerDay = 24*60*60;
    NSDate *tomorrow = [NSDate dateWithTimeInterval:secondsPerDay sinceDate:self];
    return tomorrow;
}

-(NSString *)formatterWithEEEEE_D_MMMMM_YYYY{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"dd,MM,yyyy";
    NSString *dateStr = [f stringFromDate:self];
    NSArray *ddmmyyArr = [dateStr componentsSeparatedByString:@","];
    
    return [NSString stringWithFormat:@"%@, %@ %@ %@",[NSDate dateWeekWithDate:self], ddmmyyArr[0],[NSDate monthStr:ddmmyyArr[1]],ddmmyyArr[2]];
}

+(NSString *)curMonth{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:[NSDate date]];
    monthStr = [NSDate monthStr:monthStr];
    return monthStr;
}

+(NSString *)nextMonth{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:1];
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:newdate];
    monthStr = [NSDate monthStr:monthStr];
    return monthStr;
}

+ (NSString *)monthStr:(NSString *)index{
    if (index.length == 1) {
        index = [NSString stringWithFormat:@"0%@",index];
    }
    NSDictionary *dic = @{
                          @"01":L(@"January"),
                          @"02":L(@"February"),
                          @"03":L(@"March"),
                          @"04":L(@"April"),
                          @"05":L(@"May"),
                          @"06":L(@"June"),
                          @"07":L(@"July"),
                          @"08":L(@"August"),
                          @"09":L(@"September"),
                          @"10":L(@"October"),
                          @"11":L(@"November"),
                          @"12":L(@"December")
                          };
    return dic[index]?:@"";
}

+ (NSString *)monthMMMStr:(NSString *)index{
    if (index.length == 1) {
        index = [NSString stringWithFormat:@"0%@",index];
    }
    NSDictionary *dic = @{
                          @"01":L(@"Jan"),
                          @"02":L(@"Feb"),
                          @"03":L(@"Mar"),
                          @"04":L(@"Apr"),
                          @"05":L(@"May"),
                          @"06":L(@"Jun"),
                          @"07":L(@"Jul"),
                          @"08":L(@"Aug"),
                          @"09":L(@"Sep"),
                          @"10":L(@"Oct"),
                          @"11":L(@"Nov"),
                          @"12":L(@"Dec")
                          };
    return dic[index]?:@"";
}

- (NSString *)EEE_DD_MMM{
    
    NSString *eeeStr = [NSDate dateEEEWeekWithDate:self];
    
    NSDateFormatter *fd = [[NSDateFormatter alloc] init];
    fd.dateFormat = @"dd";
    NSString *dayStr = [fd stringFromDate:self];
    if ([[dayStr substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        dayStr = [dayStr substringFromIndex:1];
    }
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:self];
    monthStr = [NSDate monthMMMStr:monthStr];
    
    
    NSString *resultStr = [NSString stringWithFormat:@"%@, %@ %@",eeeStr,dayStr,monthStr];
    
    return resultStr;
}

+ (NSDate *)ssssZToDate:(NSString *)dateStr{
    if (dateStr.length < 1) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *d = [f dateFromString:dateStr];
    
    return d;
}

- (NSString *)EEE_DD_MMM_yyyy{
    
    NSString *eeeStr = [NSDate dateEEEWeekWithDate:self];
    
    NSDateFormatter *fd = [[NSDateFormatter alloc] init];
    fd.dateFormat = @"dd";
    NSString *dayStr = [fd stringFromDate:self];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:self];
    monthStr = [NSDate monthMMMStr:monthStr];
    
    NSDateFormatter *fy = [[NSDateFormatter alloc] init];
    fy.dateFormat = @"yyyy";
    NSString *yeatStr = [fy stringFromDate:self];
    
    NSString *resultStr = [NSString stringWithFormat:@"%@, %@ %@ %@",eeeStr,dayStr,monthStr,yeatStr];
    
    return resultStr;
}

// 20 Oct 2017
- (NSString *)dd_MMM_YYYY{
    NSDateFormatter *fd = [[NSDateFormatter alloc] init];
    fd.dateFormat = @"dd";
    NSString *dayStr = [fd stringFromDate:self];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:self];
    monthStr = [NSDate monthMMMStr:monthStr];
    
    NSDateFormatter *fy = [[NSDateFormatter alloc] init];
    fy.dateFormat = @"yyyy";
    NSString *yearStr = [fy stringFromDate:self];
    
    NSString *resultStr = [NSString stringWithFormat:@"%@ %@ %@",dayStr,monthStr,yearStr];
    return resultStr;
}

// 20 October 2017
- (NSString *)dd_MMMMMMMM_YYYY{
    NSDateFormatter *fd = [[NSDateFormatter alloc] init];
    fd.dateFormat = @"dd";
    NSString *dayStr = [fd stringFromDate:self];
    if ([[dayStr substringToIndex:1] isEqualToString:@"0"]) {
        dayStr = [dayStr substringFromIndex:1];
    }
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *monthStr = [f stringFromDate:self];
    monthStr = [NSDate monthStr:monthStr];
    
    NSDateFormatter *fy = [[NSDateFormatter alloc] init];
    fy.dateFormat = @"yyyy";
    NSString *yearStr = [fy stringFromDate:self];
    
    NSString *resultStr = [NSString stringWithFormat:@"%@ %@ %@",dayStr,monthStr,yearStr];
    return resultStr;
}


+ (NSString *)dateWeekWithDate:(NSDate *)paramDate
{

    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:paramDate];
    NSInteger _weekday = [weekdayComponents weekday];
    NSString *weekStr;
    if (_weekday == 1) {
        weekStr = L(@"Sunday");
    }else if (_weekday == 2){
        weekStr = L(@"Monday");
    }else if (_weekday == 3){
        weekStr =L(@"Tuesday");
    }else if (_weekday == 4){
        weekStr =L(@"Wednesday");
    }else if (_weekday == 5){
        weekStr = L(@"Thursday");
    }else if (_weekday == 6){
        weekStr = L(@"Friday");
    }else if (_weekday == 7){
        weekStr = L(@"Saturday");
    }
    return weekStr;
}

+ (NSString *)dateEEEWeekWithDate:(NSDate *)paramDate
{
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:paramDate];
    NSInteger _weekday = [weekdayComponents weekday];
    NSString *weekStr;
    if (_weekday == 1) {
        weekStr = L(@"Sun");
    }else if (_weekday == 2){
        weekStr = L(@"Mon");
    }else if (_weekday == 3){
        weekStr =L(@"Tue");
    }else if (_weekday == 4){
        weekStr =L(@"Wed");
    }else if (_weekday == 5){
        weekStr = L(@"Thu");
    }else if (_weekday == 6){
        weekStr = L(@"Fri");
    }else if (_weekday == 7){
        weekStr = L(@"Sat");
    }
    return weekStr;
}

+ (NSString *)headerDate{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"EEE,dd MMM yyyy HH:mm:ss";
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [f setTimeZone:timeZone];
    f.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    NSDate *nowDate = [NSDate date];
    NSString *resultStr = [f stringFromDate:nowDate];
    resultStr = [NSString stringWithFormat:@"%@ GMT",resultStr];
    return resultStr;
}

- (NSString *)normalYYYY_MM_ddDate{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yyyy-MM-dd";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)MMmonthDate{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"MM";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)HHhourDate{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"HH";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)normalHH_MMDate{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"HH:mm";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)ddmmYYYYWithSlash{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"dd/MM/yyyy";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)yyyyMMddTHHmmss{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
    NSString *resultStr = [f stringFromDate:self];
    return resultStr;
}

- (NSString *)dateStrAfter:(NSInteger)days{
    NSTimeInterval secondsPerDay = 24*60*60 * days;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"EEE,dd MM yyyy";
    return [f stringFromDate:tomorrow];
}

- (NSDate *)dateAfter:(NSInteger)days{
    NSTimeInterval secondsPerDay = 24*60*60 * days;
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    return tomorrow;
}

// 1:周日  7:周六
- (NSInteger)weekInt{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:self];
    NSInteger _weekday = [weekdayComponents weekday];
    return _weekday;
}

//获取下x个月月底那一天的日期
-(NSDate *)getLastDateAfter:(NSInteger)monthNum{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    comps = [calendar components:kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:monthNum];
    [adcomps setDay:0];
    // 下x个月后的今天
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
    
    // 下x个月后的今天 字符形式
    NSString *newDateStr = [formatter stringFromDate:newdate];
    
    NSRange newMonthrange = [calendar rangeOfUnit:NSCalendarUnitDay  //NSDayCalendarUnit - ios 8
                                           inUnit: NSCalendarUnitMonth //NSMonthCalendarUnit - ios 8
                                          forDate:newdate];
    // 下x个月一共多少天
    NSInteger newMonthDays = newMonthrange.length;
    
    // 下x个月月底的字符串形式
    NSString *tempDayStr = [newDateStr stringByReplacingCharactersInRange:NSMakeRange(8, 2) withString:[NSString stringWithFormat:@"%ld",newMonthDays]];
    
    // 下x个月的月底那天的date形式
    NSDate *resultDate = [formatter dateFromString:tempDayStr];
    return resultDate;
}

@end
