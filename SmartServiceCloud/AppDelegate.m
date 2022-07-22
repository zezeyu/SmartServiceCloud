//
//  AppDelegate.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import "QMUIConfigurationTemplate.h"
#import "AppDelegate+launchOptions.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 先注册主题监听，在回调里将主题持久化存储，避免启动过程中主题发生变化时读取到错误的值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeDidChangeNotification:) name:QMUIThemeDidChangeNotification object:nil];
    
    // 2. 然后设置主题的生成器
    QMUIThemeManagerCenter.defaultThemeManager.themeGenerator = ^__kindof NSObject * _Nonnull(NSString * _Nonnull identifier) {
        if ([identifier isEqualToString:QDThemeIdentifierDefault]) return QMUIConfigurationTemplate.new;
        return nil;
    };
    
    // QD自定义的全局样式渲染
    [QDCommonUI renderGlobalAppearances];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self loadMainTabBar];
    
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


@end
