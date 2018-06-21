//
//  DQHeader.h
//  MyDqd
//
//  Created by inception on 2018/6/20.
//  Copyright © 2018年 hjy. All rights reserved.
//

#ifndef DQHeader_h
#define DQHeader_h


#define kProEnviroment 0
#define kDevEnviroment 1

#if kProEnviroment

#define DQHost @"https://xxx.com/"

#elif kDevEnviroment

#define DQHost @"https://xxx.com/"

#endif


#define kBuglyAppID @"4e3179e1cd"
#define kBuglyAppKey @"7c782bd7-0490-4b30-bdf8-5d9e4d493b98"



//common
#import "DQBaseNaviVC.h"
#import "DQBaseVC.h"

//categary
#import "UIColor+HAdd.h"
#import "UIImage+HAdd.h"
#import "UIView+HAdd.h"
#import "NSString+HAdd.h"
#import "MBProgressHUD+HAdd.h"
#import "UILabel+HAdd.h"
#import "NSDate+HAdd.h"
#import "UIButton+Hadd.h"
#import "UIViewController+HAdd.h"
#import "UITextField+HAdd.h"
#import "UIAlertController+HAdd.h"
#import "NSObject+HAdd.h"
#import "UIImageView+HAdd.h"
#import "UINavigationController+HA.h"
#import "UITableView+HAdd.h"

//vendor
#import "Masonry.h"
#import <YYText/YYText.h>
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>






#define kHeight      [[UIScreen mainScreen] bounds].size.height
#define kWidth       [[UIScreen mainScreen] bounds].size.width

#define isIphone4 kHeight == 480
#define isIphone5 kHeight == 568
#define isIphone6 kHeight == 667
#define isIphone6p kHeight == 736
#define k_isIphoneX kHeight == 812

#define iPhone5OrLow kHeight <= 568

#define kCellAddView(x) [self.contentView addSubview:(x)];
#define kNavH (k_isIphoneX? 88 : 64)
#define kTop (k_isIphoneX? 22 : 0)
#define kTabBarH (k_isIphoneX? 49 + 34 : 49)
#define kBottom (k_isIphoneX? 34 : 0)

#define kRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define ThemeColor [UIColor colorWithRed:26/255.0 green:34/255.0 blue:105/255.0 alpha:1]
#define kBlackColor [UIColor blackColor]
#define kWhiteColor [UIColor whiteColor]
#define klGrayColor [UIColor lightGrayColor]
#define kGrayBgColor [UIColor colorWithHexString:@"efefef"]
#define kLineColor [UIColor lineColor]

#define kPlaceholderColor [UIColor colorWithHexString:@"cbcaca"]

#define DQFontR(x) [UIFont systemFontOfSize:(x)]
#define DQFontB(x) [UIFont boldSystemFontOfSize:(x)]


//国际化字符串
#undef L
#define L(str) NSLocalizedString(str, nil)


#endif /* DQHeader_h */
