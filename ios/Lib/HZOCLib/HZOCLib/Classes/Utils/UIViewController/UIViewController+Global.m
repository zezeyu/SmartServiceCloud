//
//  UIViewController+Global.m
//  MiaoWan
//
//  Created by Zhiyang Fu on 11/18/15.
//  Copyright © 2015 4c. All rights reserved.
//

#import "UIViewController+Global.h"

@implementation UIViewController (Global)

+ (UIViewController *)topViewController
{
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController topVisibleViewController:rootVC];
}

+ (UIViewController *)topVisibleViewController:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self topVisibleViewController:((UITabBarController *)vc).selectedViewController];
    }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self topVisibleViewController:((UINavigationController *)vc).visibleViewController];
    }
    else if (vc.presentedViewController != nil) {
        return [self topVisibleViewController:vc.presentedViewController];
    }
    else if (vc.childViewControllers.count > 0) {
        return [self topVisibleViewController:vc.childViewControllers.lastObject];
    }
    
    return vc;
}

- (BOOL)isModal
{
    return self.presentingViewController.presentedViewController == self
    || (self.navigationController != nil && self.navigationController.presentingViewController.presentedViewController == self.navigationController)
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

@end
