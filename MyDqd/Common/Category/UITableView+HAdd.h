//
//  UITableView+HAdd.h
//  JatraTour
//
//  Created by inception on 2018/5/3.
//  Copyright © 2018年 api. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HAdd)


- (void)ha_registerCellClass:(Class )cellClass andReuseIdentifier:(NSString *)reuseIden;
- (void)ha_registerCellClassName:(NSString *)cellName andReuseIdentifier:(NSString *)reuseIden;
- (void)ha_reloadSection:(NSInteger )section withRowAnimation:(UITableViewRowAnimation)animation;
- (void)ha_reloadRowInSection:(NSInteger)section andRow:(NSInteger)row withRowAnimation:(UITableViewRowAnimation)animation;
@end
