//
//  QMUIAlertController+HZAlertController.h
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/4/30.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import "QMUIAlertController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ _Nullable HZAlertControllerToolBlock)(NSInteger buttonTag);

@interface QMUIAlertController (HZAlertController)
/**
 *显示一个alert弹窗
 */
+ (void)showAlert:(NSString * _Nullable)title
          message:(NSString * _Nullable)message
      cancelTitle:(NSString * _Nullable)cancelTitle
       titleArray:(NSArray<NSString *> * _Nullable)titleArray
          confirm:(HZAlertControllerToolBlock)confirm;

/**
 *自定义样式alert弹窗，颜色和全局统一样式
 *配置过富文本样式
 *只有两个按钮，多了丑
 *左边的按钮返回0  右边的按钮返回1
 */
+ (void)showAlertAttributes:(NSString * _Nullable)title
          message:(NSString * _Nullable)message
      cancelTitle:(NSString * _Nullable)cancelTitle
     defaultTitle:(NSString * _Nullable)defaultTitle
          confirm:(HZAlertControllerToolBlock)confirm;


@end

NS_ASSUME_NONNULL_END
