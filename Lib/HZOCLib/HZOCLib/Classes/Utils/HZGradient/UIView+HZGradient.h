//
//  UIView+HZGradient.h
//  HZGradient
//
//  Created by 何泽的mac on 2019/1/23.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 渐变方式
 - HZGradientChangeDirectionLevel:              水平渐变
 - HZGradientChangeDirectionVertical:           竖直渐变
 - HZGradientChangeDirectionUpwardDiagonalLine: 向下对角线渐变
 - HZGradientChangeDirectionDownDiagonalLine:   向上对角线渐变
 */
typedef NS_ENUM(NSInteger, HZGradientChangeDirection) {
    HZGradientChangeDirectionLevel,
    HZGradientChangeDirectionVertical,
    HZGradientChangeDirectionUpwardDiagonalLine,
    HZGradientChangeDirectionDownDiagonalLine,
};
NS_ASSUME_NONNULL_BEGIN

@interface UIView (HZGradient)

+ (UIView *_Nullable)hz_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;



- (void)hz_setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

+ (UIView *)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors direction:(HZGradientChangeDirection)direction;

- (void)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors direction:(HZGradientChangeDirection)direction;

+ (UIView *)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors;
- (void)hz_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors;

@end

NS_ASSUME_NONNULL_END
