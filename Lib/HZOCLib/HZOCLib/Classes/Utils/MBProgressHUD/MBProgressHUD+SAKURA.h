//
//  MBProgressHUD+SAKURA.h
//  venus
//
//  Created by Zhiyang Fu on 10/26/15.
//  Copyright © 2015 4c. All rights reserved.
//

#import "MBProgressHUD.h"
#define SEC   1.5

@interface MBProgressHUD (SAKURA)

+ (void)showMessage:(NSString *)message;

/**
 *  保证只有一个窗口
 */
+ (void)showMessageMonopolize:(NSString *)message;

+ (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)seconds;

+ (void)showMessage:(NSString *)message duration:(float)afterDelay hideDelegate:(id<MBProgressHUDDelegate>)delegate;
/**
 *  保证只有一个窗口
 */
+ (void)showMessageMonopolize:(NSString *)message
                     duration:(NSTimeInterval)seconds;

/**
 *  保证只有一个窗口
 *  单纯转菊花
 */
+ (void)showHUDMonopolize;
+ (void)showHUDMonopolizeInView:(UIView *)view;

/**
 *  保证只有一个窗口
 *  菊花加文字
 */
+ (void)showHUDAndTextMonopolize:(NSString *)message;
+(void)showHUDAndTextMonopolize:(NSString *)message InView:(UIView *)view;

+ (void)hideAllHUDs;
+(void)hideAllHUDs:(UIView *)view;
@end
