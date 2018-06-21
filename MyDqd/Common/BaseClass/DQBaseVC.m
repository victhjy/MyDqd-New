//
//  DQBaseVC.m
//  MyDqd
//
//  Created by inception on 2018/6/20.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "DQBaseVC.h"

@interface DQBaseVC ()

@end

@implementation DQBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

#pragma mark - UI

- (void)createUI {
    self.navigationItem.title = @"";
}


#pragma mark - private method


#pragma mark - getter



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
