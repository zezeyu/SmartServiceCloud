//
//  AppDelegate+launchOptions.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "AppDelegate+launchOptions.h"
#import "MainTabBarVC.h"
#import <HZLoginVC.h>
@implementation AppDelegate (launchOptions)

-(void)loadLoginVC{
    self.window.rootViewController = [HZLoginVC new];
}

-(void)loadMainTabBar{
    self.window.rootViewController = [MainTabBarVC new];
}

@end
