//
//  DQTabBarVC.m
//  MyDqd
//
//  Created by inception on 2018/6/20.
//  Copyright © 2018年 hjy. All rights reserved.
//

#import "DQTabBarVC.h"
#import "DQDataContainerVC.h"
#import "DQBBSContainerVC.h"
#import "DQMatchContainerVC.h"
#import "DQHomeContainerVC.h"
#import "DQCenterLoveContainerVC.h"
@interface DQTabBarVC ()

@end

@implementation DQTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    
    NSArray *vcArr = @[[DQHomeContainerVC new],[DQMatchContainerVC new],[DQCenterLoveContainerVC new],[DQBBSContainerVC new],[DQDataContainerVC new]];
    NSArray *titleArr = @[@"首页",@"比赛",@"",@"社区",@"数据"];
    
    
    self.viewControllers = @[];
}

- (UIViewController *)viewControllerWith:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)iconName andSelectedImageName:(NSString *)selectIconName {
    DQBaseNaviVC *navVC = [[DQBaseNaviVC alloc] initWithRootViewController:vc];
    navVC.tabBarItem.title = title;
    navVC.tabBarItem.image = [UIImage imageNamed:iconName];
    navVC.tabBarItem.selectedImage = [UIImage imageNamed:selectIconName];
    return navVC;
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
