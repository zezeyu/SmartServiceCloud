//
//  HZNotificationDefine.h
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/4/26.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#ifndef HZNotificationDefine_h
#define HZNotificationDefine_h
///程序被杀死前的通知
#define applicationWillKilled @"applicationWillKilled"
#define upLoadNativeDataSuccess @"upLoadNativeDataSuccess" // 更新本地数据成功
#define getLocationNotication @"getLocationNotication" //定位
#define getProcessLocationNoti @"getProcessLocationNoti"//督导详情查看定位

#define projectChanged @"projectChanged" //切换工程
#define FileNotification @"FileNotification" //文件接收
#define SWITCHDEPARMENTGROUND @"switchDeparmentGround" //切换部门图层
#define FILTERSYNCDATANOTIFICATION @"FILTERSYNCDATANOTIFICATION" //过滤

#define EDITGEOMETRYDETAIL @"editGeometryDetail" //编辑地物详情
#define UPLOADSUCCESS @"upLoadSuccess"  //详情上传
#define UPSYNCSUCCESS @"upSyncSuccess"  //同步页面
#define UPLISTSUCCESS @"upListSuccess"   //全部上传列表
#define UPRESOURCELISTSUCCESS @"upResourceListSuccess" //资源中心页面上传

#define UPSYNCFAILD @"upSyncFaild" //同步页面
#define PICTUREUPLOADFAILD  @"pictureUpLoadFaild" //详情上传
#define UPLISTFAILD @"upListFaild" //全部上传列表
#define UPRESOURCELISTFAILD @"upResourceListFaild" //资源中心页面上传

#define SHOWCHOOSEVIEWNOTI @"showChooseViewNoti" //工程选择弹窗

#endif /* HZNotificationDefine_h */
