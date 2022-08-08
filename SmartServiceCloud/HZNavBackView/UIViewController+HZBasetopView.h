//
//  UIViewController+HZBasetopView.h
//  HZNavBackView
//
//  Created by 何泽的mac on 2019/2/3.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+HZCreateUseExt.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HZBasetopView)

/**
 *导航栏view，自己控制颜色，隐藏
 */
@property(nonatomic,strong)UIImageView * hz_topView;
/**
 *和edgesForExtendedLayout是一样的
 *当hz_edgesForExtendedLayouts设置后可以刷新topview的位置
 *等价于：
 *self.edgesForExtendedLayout = hz_edgesForExtendedLayout;
  [self hz_reload_topview];
 */
@property(nonatomic,assign) UIRectEdge hz_edgesForExtendedLayout;

-(void)hz_NavigationLeftimageBut:(UIImage *)image action:(SEL)selector;
-(void)hz_NavigationLefttitleBut:(NSString *)string action:(SEL)selector;
-(void)hz_NavigationRightimageBut:(UIImage *)image action:(SEL)selector;
-(void)hz_NavigationRighttitleBut:(NSString *)string action:(SEL)selector;
-(void)hz_reload_topview;
/**
 *改变单个导航栏的高度
 *这里面的高度指的是原本的高度加上的高度
 *例如：64 + 20  20就是这个高度
 */
@property(nonatomic,assign)CGFloat hz_changeTopViewHeight;
/**
 *渐变色导航栏，渐变颜色跟随导航栏而改变。(导入
 pod 'HZGradient', '~> 1.0.3')
 */
-(void)hz_GradientColors:(NSArray<UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


@end

NS_ASSUME_NONNULL_END
