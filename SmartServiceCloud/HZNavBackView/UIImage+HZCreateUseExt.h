//
//  UIImage+HZCreateUseExt.h
//  HZNavBackView
//
//  Created by 何泽的mac on 2019/2/3.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HZCreateUseExt)

+ (UIImage *)hz_createImageByColor:(UIColor *)color size:(CGSize) size;

+ (UIImage *)hz_createImageByColor:(UIColor *)color size:(CGSize) size alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
