//
//  HZHomeVM.h
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *首页管家的事件回调
 */
typedef enum : NSInteger {
    cycleScrollDataComplete = 0,//拿到轮播图
    loadServerLayer   = 1,//加载服务器图层
    loadNativeLayer   = 2,//加载本地图层
    addAllTileLayer   = 3,//添加所有瓦片图层
    removeAllLayer    = 4,//清楚所有图层
    initManageGraphicsOverlay = 5,//初始化管理用户图层
    loadManagerServerLayer = 6,//添加管理用户网络数据
    loadLayerComplete = 7,
} home_ManagerEvent;
typedef void (^homeManagerBlock)(home_ManagerEvent event);
@interface HZHomeVM : NSObject

+ (instancetype)instance;

/***首页轮播图数据*/
@property(nonatomic,copy)NSArray *imagesURLStrings;

@property (nonatomic, copy) void (^managerBlock)(home_ManagerEvent event);
/**
 *为首页管家的各种事件传递准备Block回调方法
 */
-(void)home_ManagerEvent_Block:(homeManagerBlock)block;

-(void)loadData;

@end

NS_ASSUME_NONNULL_END
