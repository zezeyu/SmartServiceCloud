//
//  HZMedidator.m
//  HZMedidator
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMedidator.h"
#import <HZOCLib/HZOCLib.h>
#import <HZUserManager/HZUserManager.h>

@implementation HZMedidator

+(instancetype)shardInstance{
    static HZMedidator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[HZMedidator alloc]init];
    });
    return mediator;
}

-(void)initAppWithWindow:(UIWindow *)window{
    if ([HZUserManager instance].isLogin) {
        [self loadMainTabBar:window];
    }else{
        [self loadLoginVC:window];
    }
}

-(void)loadLoginVC:(UIWindow *)window{
    window.rootViewController = nil;
    Class class = NSClassFromString(@"HZLoginVC");
    UIViewController *vc = [[class alloc] init];
    window.rootViewController = vc;
    [window makeKeyAndVisible];
}

-(void)loadMainTabBar:(UIWindow *)window{
    window.rootViewController = nil;
    Class class = NSClassFromString(@"HZMainTabBarVC");
    QDTabBarViewController *vc = [[class alloc] init];
    window.rootViewController = vc;
    [window makeKeyAndVisible];
}

@end
