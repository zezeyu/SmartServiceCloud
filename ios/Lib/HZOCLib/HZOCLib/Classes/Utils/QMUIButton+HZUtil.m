//
//  QMUIButton+HZUtil.m
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/5/7.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import "QMUIButton+HZUtil.h"

@implementation QMUIButton (HZUtil)
/**
 *快速打印一个图片在上、文字在下的按钮
 */
- (instancetype)initWithButtonImagePositionTopImage:(id _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size
{
    self = [super init];
    if (self) {
        self.imagePosition = QMUIButtonImagePositionTop;
        [self setImage:[self backImage:imageStr] forState:UIControlStateNormal];
        self.titleLabel.font = UIFontMake(size);
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        self.spacingBetweenImageAndTitle = 8;
    }
    return self;
}
/**
 *快速打印一个图片在下、文字在上的按钮
 */
-(instancetype)initWithButtonImagePositionBottomImage:(id _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size{
    self = [super init];
    if (self) {
        self.imagePosition = QMUIButtonImagePositionBottom;
        [self setImage:[self backImage:imageStr] forState:UIControlStateNormal];
        self.titleLabel.font = UIFontMake(size);
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        self.spacingBetweenImageAndTitle = 8;
    }
    return self;
}
/**
 *快速打印一个普通按钮
 */
- (instancetype)initWithImage:(id _Nullable)imageStr Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color fontSize:(CGFloat)size
{
    self = [super init];
    if (self) {
        [self setImage:[self backImage:imageStr] forState:UIControlStateNormal];
        self.titleLabel.font = UIFontMake(size);
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}
- (instancetype)initWithImageBg:(id _Nullable)imageStr selectedImage:(id _Nullable)selected_image Title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)color titleSelectedColor:(UIColor * _Nullable)title_s fontSize:(CGFloat)size
{
    self = [super init];
    if (self) {
        [self setBackgroundImage:[self backImage:imageStr] forState:UIControlStateNormal];
        [self setBackgroundImage:[self backImage:selected_image] forState:UIControlStateSelected];
        self.titleLabel.font = UIFontMake(size);
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setTitleColor:title_s forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}
- (instancetype)initWithImage:(id _Nullable)imageStr bgImage:(id _Nullable)bg_image
{
    self = [super init];
    if (self) {
        [self setImage:[self backImage:imageStr] forState:UIControlStateNormal];
        [self setBackgroundImage:[self backImage:bg_image] forState:UIControlStateNormal];
    }
    return self;
}
- (instancetype)initWithBgImage:(id _Nullable)bg_image selectedBg_image:(id _Nullable)selected_image
{
    self = [super init];
    if (self) {
        [self setBackgroundImage:[self backImage:bg_image] forState:UIControlStateNormal];
        [self setBackgroundImage:[self backImage:selected_image] forState:UIControlStateSelected];
    }
    return self;
}

- (instancetype)initWithImage:(id _Nullable)imageStr bgImage:(id _Nullable)bg_image cornerRadius:(CGFloat)radius
{
    self = [super init];
    if (self) {
        self.cornerRadius = radius;
        [self setImage:[self backImage:imageStr] forState:UIControlStateNormal];
        [self setBackgroundImage:[self backImage:bg_image] forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithImage:(id _Nullable)image selected_image:(id _Nullable)selected_image
{
    self = [super init];
    if (self) {
        [self setImage:[self backImage:image] forState:UIControlStateNormal];
        [self setImage:[self backImage:selected_image] forState:UIControlStateSelected];
    }
    return self;
}

-(id)backImage:(id)image{
    if ([image isKindOfClass:[NSString class]]) {
       return UIImageMake(image);
    }
    if ([image isKindOfClass:[UIImage class]]) {
       return image;
    }
    return image;
}

@end
