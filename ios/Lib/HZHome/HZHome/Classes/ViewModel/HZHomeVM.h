//
//  HZHomeVM.h
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import <Foundation/Foundation.h>
@class HZHomeMenuModel;
@class HZHomeRecommendSondModel;
NS_ASSUME_NONNULL_BEGIN
@protocol HZHomeVMDelegate <NSObject>

@required

@optional
-(void)reloadTableView;

-(void)reloadCollectionView;
@end

/**
 *首页管家的事件回调
 */
typedef enum : NSInteger {
    cycleScrollDataComplete = 0,//拿到轮播图
    menuDataComplete   = 1,//拿到了菜单数据
    recommendSongListComplete   = 2,//拿到了推荐歌单数据
} home_ManagerEvent;
typedef void (^homeManagerBlock)(home_ManagerEvent event);
@interface HZHomeVM : NSObject

+ (instancetype)instance;

@property(nonatomic,weak)id<HZHomeVMDelegate> delegate;
/***首页轮播图数据*/
@property(nonatomic,copy)NSArray *imagesURLStrings;

/***menu的数据*/
@property(nonatomic,copy)NSArray <HZHomeMenuModel *>*menus;

/***推荐歌单的数据*/
@property(nonatomic,copy)NSArray <HZHomeRecommendSondModel *>*recommendSongs;

@property (nonatomic, copy) void (^managerBlock)(home_ManagerEvent event);
/**
 *为首页管家的各种事件传递准备Block回调方法
 */
-(void)home_ManagerEvent_Block:(homeManagerBlock)block;

-(void)loadData;

@end

NS_ASSUME_NONNULL_END
