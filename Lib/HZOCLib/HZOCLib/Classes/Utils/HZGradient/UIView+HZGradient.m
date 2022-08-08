//
//  UIView+HZGradient.m
//  HZGradient
//
//  Created by 何泽的mac on 2019/1/23.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import "UIView+HZGradient.h"

@implementation UIView (HZGradient)

+ (Class)layerClass{
    return [CAGradientLayer class];
}
    
+ (UIView *)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    UIView * view = [[self alloc]init];
    [view hz_setGradientBackgroundWithColors:colors startPoint:startPoint endPoint:endPoint];
    return view;
}
    
- (void)hz_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    NSMutableArray * colorsM = [NSMutableArray array];
    for (UIColor * color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        CAGradientLayer * layer = (CAGradientLayer *)self.layer;
        layer.colors = [colorsM copy];
        layer.startPoint = startPoint;
        layer.endPoint   = endPoint;
    }
}

+ (UIView *)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors{
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 0);
    UIView * view = [[self alloc]init];
    [view hz_setGradientBackgroundWithColors:colors startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)hz_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors{
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 0);
    NSMutableArray * colorsM = [NSMutableArray array];
    for (UIColor * color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        CAGradientLayer * layer = (CAGradientLayer *)self.layer;
        layer.colors = [colorsM copy];
        layer.startPoint = startPoint;
        layer.endPoint   = endPoint;
    }
}

+ (UIView *)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors direction:(HZGradientChangeDirection)direction{
    CGPoint startPoint = CGPointZero;
    if (direction == HZGradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case HZGradientChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case HZGradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case HZGradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case HZGradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    UIView * view = [[self alloc]init];
    [view hz_setGradientBackgroundWithColors:colors startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)hz_gradientViewWithColors:(NSArray<UIColor *> *)colors direction:(HZGradientChangeDirection)direction{
    CGPoint startPoint = CGPointZero;
    if (direction == HZGradientChangeDirectionDownDiagonalLine) {
        startPoint = CGPointMake(0.0, 1.0);
    }
    CGPoint endPoint = CGPointZero;
    switch (direction) {
        case HZGradientChangeDirectionLevel:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case HZGradientChangeDirectionVertical:
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case HZGradientChangeDirectionUpwardDiagonalLine:
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case HZGradientChangeDirectionDownDiagonalLine:
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    [self hz_setGradientBackgroundWithColors:colors startPoint:startPoint endPoint:endPoint];
}

@end

@implementation UILabel (CADGradient)
    
+(Class)layerClass{
    return [CAGradientLayer class];
}
    
@end

