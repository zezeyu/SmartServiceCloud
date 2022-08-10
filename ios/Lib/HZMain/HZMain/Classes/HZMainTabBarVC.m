//
//  HZMainTabBarVC.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMainTabBarVC.h"
#import "HZHomeVC.h"
#import "HZMineVC.h"

@interface HZMainTabBarVC ()

@end

@implementation HZMainTabBarVC

-(void)didInitialize{
    [super didInitialize];
    [self initVC];
}

-(void)initVC{
    HZHomeVC *homeViewController = [[HZHomeVC alloc] init];
    homeViewController.hidesBottomBarWhenPushed = NO;
    QDNavigationController *homeNavController = [[QDNavigationController alloc] initWithRootViewController:homeViewController];
    homeNavController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"首页" image:UIImageMake(@"icon_tabbar_uikit") selectedImage:UIImageMake(@"icon_tabbar_uikit_selected") tag:0];
    
    HZMineVC *mineViewController = [[HZMineVC alloc] init];
    mineViewController.hidesBottomBarWhenPushed = NO;
    QDNavigationController *mineNavController = [[QDNavigationController alloc] initWithRootViewController:mineViewController];
    mineNavController.tabBarItem = [QDUIHelper tabBarItemWithTitle:@"我的" image:UIImageMake(@"icon_tabbar_component") selectedImage:UIImageMake(@"icon_tabbar_component_selected") tag:1];
    
    // window root controller
    self.viewControllers = @[homeNavController, mineNavController];
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
