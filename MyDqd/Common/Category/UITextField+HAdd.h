//
//  UITextField+HAdd.h
//  SpotMe
//
//  Created by huangjinyang on 17/12/17.
//  Copyright © 2017年 artapranti. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TFAction)(UITextField *tf);
@interface UITextField (HAdd)
@property(nonatomic, copy) TFAction block;

- (void)addEditValueChangeBlock:(TFAction )block;

@end
