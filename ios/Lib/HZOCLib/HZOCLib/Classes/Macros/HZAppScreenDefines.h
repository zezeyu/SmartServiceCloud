//
//  HZAppScreenDefines.h
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/4/26.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#ifndef HZAppScreenDefines_h
#define HZAppScreenDefines_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kWindow [UIApplication sharedApplication].delegate.window //[UIApplication sharedApplication].keyWindow
//以效果图为iphone6的尺寸布局
#define AutoWidth(x) (x/375.0*[UIScreen mainScreen].bounds.size.width)
#define AutoHeight(x) (x/667.0*[UIScreen mainScreen].bounds.size.height)
#define degreesToRadians(x) (M_PI*(x)/180.0)

#define IS_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define kStatusBarHeight [[UIApplication sharedApplication]statusBarFrame].size.height
#define kNavBarHeight 44
#define kTopHeight (kStatusBarHeight + kNavBarHeight)
#define kTabBarHeight (kStatusBarHeight > 20 ? 83 :49)
#define kiOS4S_5S (IS_IPHONE && kScreenWidth == 320)
#define kiOS6S (IS_IPHONE && kScreenWidth == 375.0)
#define kiOS6Plus (IS_IPHONE && kScreenWidth == 414.0)
#define IS_IPhoneX (kStatusBarHeight > 20 ? YES : NO)

#define SEC   1.5

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif

//屏幕宽度
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//导航栏按钮选中背景色
#define NaviSelectedBgColor [UIColor qmui_colorWithHexString:@"#26a69a"]
//深灰色背景颜色
#define WhiteColor [UIColor qmui_colorWithHexString:@"#FFFFFF"]
//深灰色背景颜色
#define Background_DarkGrayColor [UIColor qmui_colorWithHexString:@"#F1F1F1"]
//浅深灰色背景颜色
#define Background_LightDarkGrayColor [UIColor qmui_colorWithHexString:@"#E8E8E8"]
//浅灰色背景颜色
#define Background_LightGrayColor [UIColor qmui_colorWithHexString:@"#FAFAFA"]
//亮红色
#define Bright_RedColor [UIColor qmui_colorWithHexString:@"#E82D4C"]
//深绿色
#define Dark_GreenColor [UIColor qmui_colorWithHexString:@"#11776A"]
//深灰色文字颜色
#define Text_DarkGrayColor [UIColor qmui_colorWithHexString:@"#373636"]
//浅灰色文字颜色
#define Text_LightGrayColor [UIColor qmui_colorWithHexString:@"#969696"]
//View边框颜色
#define Border_Color [UIColor qmui_colorWithHexString:@"#e3e3e3"]
//黑色文字
#define text_blackColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
//字体大小
#define TEXT_FONT UIFontMake(14)

#define kKeychainService [[NSBundle mainBundle] bundleIdentifier]


#define ProcessRead @"/api/supervisorUserRead"
#define MapNormal  10000 //常规
#define MapMeasureLength  10001//测距与方位角
#define MapMeasureArea 10002//测距与方位角
#define MapMeasureCorner 10003//转角
#define NavDrive  10004//驾车
#define NavRide  10005//骑行
#define NavWalk 10006//步行
#define MapAnnotation  10007//标注
#define MapAnnotationPoint  10008//点标注
#define MapAnnotationLine  10009//线标注
#define MapAnnotationArea  10010//面标注
#define MapClooseGround 10011 //选择地物
#define MapCloosePoint 10012 //地图选点

#define NavStartPoint 1010
#define NavendPoint 1011

#define GeoStartPoint 1200
#define GeoEndPoint 1201

#define S_MeasureLength @"距离与方位角"
#define S_MeasureArea @"面积与周长"
#define S_MeasureCorner @"转角"
#define S_UpLoad @"上传"
#define S_SubmitResult @"提交成果"
#define S_Supervision @"过程督导"
#define S_Protocols @"协议"
#define S_Favorites @"收藏夹"
#define S_DIRECTOR @"DIRECTOR"
#define S_DESIGNER @"DESIGNER"


#endif /* HZAppScreenDefines_h */
