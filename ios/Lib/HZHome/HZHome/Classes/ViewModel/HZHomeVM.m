//
//  HZHomeVM.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeVM.h"
#import "HZHomeModel.h"
#import "HZReactNativeVC.h"
#import <React/RCTRootView.h>
@implementation HZHomeVM

+ (instancetype)instance{
    static HZHomeVM *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HZHomeVM alloc] init];
    });
    return _instance;
}

-(void)home_ManagerEvent_Block:(homeManagerBlock)block{
    self.managerBlock = block;
}

///请求网络
-(void)loadData{
    HZHomeModel *model = [[HZHomeModel alloc]init];
    _imagesURLStrings = model.imagesURLStrings;
    self.managerBlock(cycleScrollDataComplete);//拿到了轮播图视图
    
    HZHomeModel *menuData = [HZHomeModel mj_objectWithKeyValues:[JSONUtil requestDataWithName:@"menuData"]];
    _menus = menuData.menuData;
    self.managerBlock(menuDataComplete);
    
    HZHomeModel *songList = [HZHomeModel mj_objectWithKeyValues:[JSONUtil requestDataWithName:@"RecommendSongList"]];
    _recommendSongs = songList.songList;
    self.managerBlock(recommendSongListComplete);
    
}

+(void)goToReactPage{
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.8.100:8081/index.bundle?platform=ios"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"Home" initialProperties:@{@"scores" : @[
                                     @{
                                       @"name" : @"Alex",
                                       @"value": @"42"
                                      },
                                     @{
                                       @"name" : @"Joel",
                                       @"value": @"10"
                                     }
                                   ]
                                 }
                                   launchOptions: nil];
    HZReactNativeVC *vc = [[HZReactNativeVC alloc] init];
    vc.view = rootView;
    [[UIViewController currentViewController].navigationController pushViewController:vc animated:YES];
}

@end
