//
//  UIViewController+Utils.m
//  venus
//
//  Created by Tedzhou on 15/8/1.
//  Copyright (c) 2015年 4c. All rights reserved.
//

#import "UIViewController+Utils.h"


@implementation UIViewController (Utils)

+ (UIViewController *)findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.selectedViewController];
        } else {
            return vc;
        }
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}
+ (UIViewController *)currentViewControllerInKeyWindow
{
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *viewController = currentWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UIViewController *)currentViewController
{
    // 程序初始化的第一个 window...不会被 popup alertview 等影响。
    UIWindow *currentWindow = [UIApplication sharedApplication].delegate.window;
    UIViewController *viewController = currentWindow.rootViewController;
    
    UIViewController * result = [UIViewController findBestViewController:viewController];
    return result;
}
@end
