//
//  UIViewController+Global.h
//  MiaoWan
//
//  Created by Zhiyang Fu on 11/18/15.
//  Copyright © 2015 4c. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Global)

+ (UIViewController *)topViewController;
- (BOOL)isModal;

@end
