//
//  AppDelegate.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import "AppDelegate+launchOptions.h"
#import <HZThemeManager.h>
#import "QMUIConfigurationTemplate.h"
#import "QMUIConfigurationTemplateGrapefruit.h"
#import "QMUIConfigurationTemplateGrass.h"
#import "QMUIConfigurationTemplatePinkRose.h"
#import "QMUIConfigurationTemplateDark.h"
#import <HZMedidator.h>
#import <HZMain/HZMainTabBarVC.h>
#import <HZLogin/HZLoginVC.h>
#import <HZUserManager/HZUserManager.h>
@interface AppDelegate ()<MedidatorDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 先注册主题监听，在回调里将主题持久化存储，避免启动过程中主题发生变化时读取到错误的值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeDidChangeNotification:) name:QMUIThemeDidChangeNotification object:nil];
    
    // 2. 然后设置主题的生成器
    QMUIThemeManagerCenter.defaultThemeManager.themeGenerator = ^__kindof NSObject * _Nonnull(NSString * _Nonnull identifier) {
        if ([identifier isEqualToString:QDThemeIdentifierDefault]) return QMUIConfigurationTemplate.new;
        if ([identifier isEqualToString:QDThemeIdentifierGrapefruit]) return QMUIConfigurationTemplateGrapefruit.new;
        if ([identifier isEqualToString:QDThemeIdentifierGrass]) return QMUIConfigurationTemplateGrass.new;
        if ([identifier isEqualToString:QDThemeIdentifierPinkRose]) return QMUIConfigurationTemplatePinkRose.new;
        if ([identifier isEqualToString:QDThemeIdentifierDark]) return QMUIConfigurationTemplateDark.new;
        return nil;
    };
    // 3. 再针对 iOS 13 开启自动响应系统的 Dark Mode 切换
    // 如果不需要这个功能，则不需要这一段代码
    if (@available(iOS 13.0, *)) {
        if (QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier) {
            QMUIThemeManagerCenter.defaultThemeManager.identifierForTrait = ^__kindof NSObject<NSCopying> * _Nonnull(UITraitCollection * _Nonnull trait) {
                if (trait.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    return QDThemeIdentifierDark;
                }
                if ([QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier isEqual:QDThemeIdentifierDark]) {
                    return QDThemeIdentifierDefault;
                }
                return QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier;
            };
            QMUIThemeManagerCenter.defaultThemeManager.respondsSystemStyleAutomatically = YES;
        }
    }
    
    // QD自定义的全局样式渲染
    [QDCommonUI renderGlobalAppearances];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [HZMedidator shardInstance].delegate = self;
    if ([HZUserManager instance].isLogin) {
        [self loadMainTabBar];
    }else{
        [self loadLoginVC];
    }
    
    return YES;
}

- (void)handleThemeDidChangeNotification:(NSNotification *)notification {
    
    QMUIThemeManager *manager = notification.object;
    if (![manager.name isEqual:QMUIThemeManagerNameDefault]) return;
    
    [[NSUserDefaults standardUserDefaults] setObject:manager.currentThemeIdentifier forKey:QDSelectedThemeIdentifier];
    
    [QDThemeManager.currentTheme applyConfigurationTemplate];
    
    if (QMUIHelper.canUpdateAppearance) {
        // 主题发生变化，在这里更新全局 UI 控件的 appearance
        [QDCommonUI renderGlobalAppearances];
        
        // 更新表情 icon 的颜色
        [QDUIHelper updateEmotionImages];
    }
}

#pragma --mark 加载登录页面
- (void)loadLoginVC {
    self.window.rootViewController = nil;
    self.window.rootViewController = [[HZLoginVC alloc]init];
}
#pragma --mark 加载主工程
- (void)loadMainTabBar {
    self.window.rootViewController = nil;
    HZMainTabBarVC *vc = [[HZMainTabBarVC alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}
#pragma --mark 跳转到push转场动画的页面
-(void)goToVehicleArchivesVC{
    
}

@end
