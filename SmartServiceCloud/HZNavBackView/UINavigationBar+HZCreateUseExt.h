//
//  UINavigationBar+HZCreateUseExt.h
//  HZNavBackView
//
//  Created by 何泽的mac on 2019/2/3.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kHZScreenWidth [UIScreen mainScreen].bounds.size.width
#define kHZScreenHeight [UIScreen mainScreen].bounds.size.height

/// 操作系统版本号，只获取第二级的版本号，例如 10.3.1 只会得到 10.3
#define kHZIOS_VERSION ([[[UIDevice currentDevice] systemVersion] doubleValue])
/// 用户界面横屏了才会返回YES
#define kHZIS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
/// navigationBar 的静态高度
#define kHZNavigationBarHeight ([HZ_Tool getIsIpad] ? (kHZIOS_VERSION >= 12.0 ? 50 : 44) : (kHZIS_LANDSCAPE ? 32 : 44))
#define kHZTopHeight ([[UIApplication sharedApplication] statusBarFrame].size.height + kHZNavigationBarHeight)
#import "UIImage+HZCreateUseExt.h"
NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (HZCreateUseExt)

-(void)hz_setElementsHidden;



@end

@interface HZ_Tool : NSObject

+ (BOOL)getIsIpad;

@end

NS_ASSUME_NONNULL_END
