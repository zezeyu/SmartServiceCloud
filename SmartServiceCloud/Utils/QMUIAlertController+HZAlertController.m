//
//  QMUIAlertController+HZAlertController.m
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/4/30.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import "QMUIAlertController+HZAlertController.h"
#import "QDThemeManager.h"

@implementation QMUIAlertController (HZAlertController)

+(void)showAlert:(NSString * _Nullable)title message:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancelTitle titleArray:(NSArray<NSString *> * _Nullable)titleArray confirm:(HZAlertControllerToolBlock)confirm{
    QMUIAlertController *alertController = [QMUIAlertController alertControllerWithTitle:title message:message preferredStyle:QMUIAlertControllerStyleAlert];
    if (!cancelTitle || cancelTitle.length == 0) {
        
    }else{
        QMUIAlertAction *cancel = [QMUIAlertAction actionWithTitle:cancelTitle style:QMUIAlertActionStyleCancel handler:^(__kindof QMUIAlertController *aAlertController, QMUIAlertAction *action) {
            if (confirm) {
                confirm(0);
            }
        }];
        [alertController addAction:cancel];
    }
    
    if (!titleArray || titleArray.count == 0) {
        
    }else{
        for (int i = 0; i < titleArray.count; i ++) {
            QMUIAlertAction *sure = [QMUIAlertAction actionWithTitle:titleArray[i] style:QMUIAlertActionStyleDestructive handler:^(__kindof QMUIAlertController *aAlertController, QMUIAlertAction *action) {
                if (confirm) {
                    confirm(i + 1);
                }
            }];
            [alertController addAction:sure];
        }
    }
    [alertController showWithAnimated:YES];
}

+ (void)showAlertAttributes:(NSString * _Nullable)title
                    message:(NSString * _Nullable)message
                cancelTitle:(NSString * _Nullable)cancelTitle
               defaultTitle:(NSString * _Nullable)defaultTitle
                    confirm:(HZAlertControllerToolBlock)confirm{
    QMUIAlertController *alertController = [[QMUIAlertController alloc] initWithTitle:title message:message preferredStyle:QMUIAlertControllerStyleAlert];
    NSMutableDictionary *titleAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertTitleAttributes];
    titleAttributs[NSForegroundColorAttributeName] = UIColorWhite;
    alertController.alertTitleAttributes = titleAttributs;
    NSMutableDictionary *messageAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertMessageAttributes];
    messageAttributs[NSForegroundColorAttributeName] = UIColorMakeWithRGBA(255, 255, 255, 0.75);
    alertController.alertMessageAttributes = messageAttributs;
    alertController.alertHeaderBackgroundColor = UIColor.qd_tintColor ;
    alertController.alertSeparatorColor = alertController.alertButtonBackgroundColor;
    alertController.alertTitleMessageSpacing = 7;
    
    NSMutableDictionary *buttonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertButtonAttributes];
    buttonAttributes[NSForegroundColorAttributeName] = alertController.alertHeaderBackgroundColor;
    alertController.alertButtonAttributes = buttonAttributes;
    
    NSMutableDictionary *cancelButtonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertCancelButtonAttributes];
    cancelButtonAttributes[NSForegroundColorAttributeName] = buttonAttributes[NSForegroundColorAttributeName];
    alertController.alertCancelButtonAttributes = cancelButtonAttributes;
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:cancelTitle ?:@"取消" style:QMUIAlertActionStyleCancel handler:^(__kindof QMUIAlertController *aAlertController, QMUIAlertAction *action) {
        if (confirm) {
            confirm(0);
        }
    }];
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:defaultTitle ?:@"确定" style:QMUIAlertActionStyleDefault handler:^(__kindof QMUIAlertController *aAlertController, QMUIAlertAction *action) {
        if (confirm) {
            confirm(1);
        }
    }];
    [action2.button setImage:[[UIImageMake(@"icon_emotion") qmui_imageResizedInLimitedSize:CGSizeMake(18, 18) resizingMode:QMUIImageResizingModeScaleToFill] qmui_imageWithTintColor:UIColor.qd_tintColor] forState:UIControlStateNormal];
    
    action2.button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController showWithAnimated:YES];
}

@end
