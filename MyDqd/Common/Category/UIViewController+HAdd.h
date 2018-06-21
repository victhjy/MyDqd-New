//
//  UIViewController+HAdd.h
//  JatraTour
//
//  Created by huangjinyang on 17/12/5.
//  Copyright © 2017年 api. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end
@interface UIViewController (HAdd)<BackButtonHandlerProtocol>

@end
