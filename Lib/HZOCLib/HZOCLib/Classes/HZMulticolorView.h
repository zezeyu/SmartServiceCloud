//
//  HZMulticolorView.h
//  cheanda
//
//  Created by 何泽的mac on 2018/11/26.
//  Copyright © 2018年 车安达. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZMulticolorView : UIView

@property (nonatomic, assign) CGFloat          lineWidth;  // 圆的线宽
@property (nonatomic, assign) CFTimeInterval   sec;        // 秒
@property (nonatomic, assign) CGFloat          percent;    // 百分比
@property (nonatomic, assign) BOOL             isReverse;
@property (nonatomic, strong) NSArray         *colors;     // 颜色组(CGColor)

@property (nonatomic, strong) NSArray         *lineDashPattern;//断点组

- (void)startAnimation:(CGFloat)strokeStart strokeEnd:(CGFloat )strokeEnd;
- (void)endAnimation;

@end

NS_ASSUME_NONNULL_END
