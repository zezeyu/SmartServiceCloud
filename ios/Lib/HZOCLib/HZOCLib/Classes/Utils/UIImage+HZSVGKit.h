//
//  UIImage+HZSVGKit.h
//  HZOCLib
//
//  Created by 何泽 on 2022/8/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HZSVGKit)

/// 单纯加载svg图片
/// @param name 图片名
/// @param imgv 显示的UIImageView
+(UIImage *)svgImageNamed:(NSString *)name size:(CGSize)size;

/// 加载svg图片，用16进制色值修改颜色
/// @param name 图片名
/// @param imgv 显示的UIImageView
/// @param hexColor 16进制色值
+(UIImage *)svgImageNamed:(NSString *)name size:(CGSize)size hexColor:(NSString *)hexColor;

/// 加载svg图片，用色值对象修改颜色
/// @param name 图片名
/// @param imgv 显示的UIImageView
/// @param objColor 色值对象
+(UIImage *)svgImageNamed:(NSString *)name size:(CGSize)size objColor:(UIColor *)objColor;

@end

NS_ASSUME_NONNULL_END
