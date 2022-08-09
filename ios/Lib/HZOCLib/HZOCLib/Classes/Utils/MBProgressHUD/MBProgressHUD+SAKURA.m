//
//  MBProgressHUD+SAKURA.m
//  venus
//
//  Created by Zhiyang Fu on 10/26/15.
//  Copyright © 2015 4c. All rights reserved.
//

#import "MBProgressHUD+SAKURA.h"

@implementation MBProgressHUD (SAKURA)

+ (void)showMessage:(NSString *)message
{
    [MBProgressHUD showMessage:message duration:SEC];
}

+ (void)showMessageMonopolize:(NSString *)message
{
    [MBProgressHUD showMessageMonopolize:message duration:SEC];
}

+ (void)showMessage:(NSString *)message
           duration:(NSTimeInterval)seconds
{
//    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode      = MBProgressHUDModeText;
    if (IS_IPHONE && SCREEN_WIDTH < 374.0) {
        hud.label.font = [UIFont systemFontOfSize:14];
    }
    hud.label.text = message;
    hud.userInteractionEnabled    = NO;
    hud.removeFromSuperViewOnHide = YES;
    
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:seconds];
}

+ (void)showMessage:(NSString *)message duration:(float)afterDelay hideDelegate:(id<MBProgressHUDDelegate>)delegate
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode      = MBProgressHUDModeText;
    hud.label.text = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:afterDelay];
    
    hud.delegate = delegate;
}

+ (void)showMessageMonopolize:(NSString *)message
                     duration:(NSTimeInterval)seconds
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideAllHUDs:window];
    [MBProgressHUD showMessage:message duration:seconds];
}

+ (void)showHUDMonopolize
{
    [self showHUDAndTextMonopolize:nil];
}
+ (void)showHUDMonopolizeInView:(UIView *)view{
    [self showHUDAndTextMonopolize:nil InView:view];
}

+ (void)showHUDAndTextMonopolize:(NSString *)message
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [MBProgressHUD hideAllHUDs:window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode      = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    hud.userInteractionEnabled    = NO;
    hud.removeFromSuperViewOnHide = YES;
}

+(void)showHUDAndTextMonopolize:(NSString *)message InView:(UIView *)view{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    if (view == nil) {
        view = window;
    }
    [MBProgressHUD hideAllHUDs:window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode      = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    hud.userInteractionEnabled    = NO;
    hud.removeFromSuperViewOnHide = YES;
}

+ (void)hideAllHUDs
{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        [MBProgressHUD hideAllHUDs:window];
    }
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

+(void)hideAllHUDs:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:NO];
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

@end
