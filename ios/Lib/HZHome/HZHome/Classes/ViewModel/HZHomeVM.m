//
//  HZHomeVM.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeVM.h"
#import "HZHomeModel.h"

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
    self.managerBlock(cycleScrollDataComplete);
    
    HZHomeModel *menuData = [HZHomeModel mj_objectWithKeyValues:[JSONUtil requestDataWithName:@"menuData"]];
    _menus = menuData.menuData;
    
    HZHomeModel *songList = [HZHomeModel mj_objectWithKeyValues:[JSONUtil requestDataWithName:@"RecommendSongList"]];
    _recommendSongs = songList.songList;
    
}

@end
