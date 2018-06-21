//
//  UITextField+HAdd.m
//  SpotMe
//
//  Created by huangjinyang on 17/12/17.
//  Copyright © 2017年 artapranti. All rights reserved.
//

#import "UITextField+HAdd.h"

@implementation UITextField (HAdd)
static char kHandlerBlockKey;

- (void)addEditValueChangeBlock:(TFAction)block {
    if (!self.block) {
        self.block = block;
    }
    
    [self addTarget:self action:@selector(tfChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)tfChanged:(UITextField *)tf {
    if (self.block) {
        self.block(tf);
    }
}

- (void)setBlock:(TFAction)block {
    objc_setAssociatedObject(self, &kHandlerBlockKey, block, OBJC_ASSOCIATION_COPY);
}

-(TFAction)block{
    return objc_getAssociatedObject(self, &kHandlerBlockKey);
}

@end
