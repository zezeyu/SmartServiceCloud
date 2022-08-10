//
//  QMUIButton+HZUtil.h
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/5/7.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import "QMUIButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface QMUIButton (HZUtil)
/**
 *快速打印一个图片在上、文字在下的按钮
 */
- (instancetype)initWithButtonImagePositionTopImage:(id _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size;
/**
 *快速打印一个图片在下、文字在上的按钮
 */
-(instancetype)initWithButtonImagePositionBottomImage:(id  _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size;
/**
 *快速打印一个普通按钮
 */
- (instancetype)initWithImage:(id _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size;
- (instancetype)initWithImageBg:(id _Nullable)imageStr selectedImage:(id _Nullable)selected_image Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color titleSelectedColor:(UIColor * _Nullable)title_s fontSize:(CGFloat)size;
- (instancetype)initWithImage:(id _Nullable)imageStr bgImage:(id _Nullable)bg_image;
- (instancetype)initWithBgImage:(id _Nullable)bg_image selectedBg_image:(id _Nullable)selected_image;
- (instancetype)initWithImage:(id _Nullable)imageStr bgImage:(id _Nullable)bg_image cornerRadius:(CGFloat)radius;
- (instancetype)initWithImage:(id _Nullable)image selected_image:(id _Nullable)selected_image;
-(id)backImage:(id)image;

@end

NS_ASSUME_NONNULL_END
