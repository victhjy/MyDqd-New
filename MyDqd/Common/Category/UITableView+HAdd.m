//
//  UITableView+HAdd.m
//  JatraTour
//
//  Created by inception on 2018/5/3.
//  Copyright © 2018年 api. All rights reserved.
//

#import "UITableView+HAdd.h"

@implementation UITableView (HAdd)

- (void)ha_registerCellClass:(Class )cellClass andReuseIdentifier:(NSString *)reuseIden {
    if (reuseIden.length < 1) {
        reuseIden = NSStringFromClass(cellClass);
    }
    [self registerClass:cellClass forCellReuseIdentifier:reuseIden];
}

- (void)ha_registerCellClassName:(NSString *)cellName andReuseIdentifier:(NSString *)reuseIden {
    if (reuseIden.length < 1) {
        reuseIden = cellName;
    }
    [self registerClass:NSClassFromString(cellName) forCellReuseIdentifier:reuseIden];
}

- (void)ha_reloadSection:(NSInteger )section withRowAnimation:(UITableViewRowAnimation)animation {
    if (!animation) {
        animation = UITableViewRowAnimationNone;
    }
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:animation];
}

- (void)ha_reloadRowInSection:(NSInteger)section andRow:(NSInteger)row withRowAnimation:(UITableViewRowAnimation)animation {
    if (!animation) {
        animation = UITableViewRowAnimationNone;
    }
    [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:animation];
    
}



@end
