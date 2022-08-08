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

///下面的方法只是为了看看多年前写过的UI效果
/****
 *跳转到主工程下的车辆管理VC
 */
-(void)goToVehicleArchivesVC;

@end

NS_ASSUME_NONNULL_END
