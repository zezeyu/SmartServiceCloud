//
//  MedidatorDelegate.h
//  HZMedidator
//
//  Created by 何泽 on 2022/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MedidatorDelegate <NSObject>

@optional
/**
 *加载主工程tabBar
 */
-(void)loadMainTabBar;
/**
 *加载登录页面
 */
-(void)loadLoginVC;

@end

NS_ASSUME_NONNULL_END
