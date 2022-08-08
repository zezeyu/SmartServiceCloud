//
//  HZHomeVC.m
//  HZHome
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZHomeVC.h"
#import <HZOCLib/HZOCLib.h>
#import <HZMedidator/HZMedidator.h>
#define k2017 @"2017年不规则按钮（OC）"
#define k2018 @"2018年写的push转场动画（Swift）"
#define k2018_2 @"2018年写的自定义导航栏（OC）"
#define k2019 @"2019开始学习架构(ArcGIS项目)"
#define k2020 @"2020开始了项目管理"
#define k2020_2 @"2020年开始撸前端"
#define k2021 @"2021原型已经画的很6了"
#define k2022 @"2022年开始了物联网项目"

@interface HZHomeVC ()

@end

@implementation HZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.dataSource = @[k2017,k2018,k2018_2,k2019,k2020,k2020_2,k2021,k2022];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

-(void)didSelectCellWithTitle:(NSString *)title{
    if ([title isEqualToString:k2018]) {
        if ([[HZMedidator shardInstance].delegate respondsToSelector:@selector(goToVehicleArchivesVC)]) {
            [[HZMedidator shardInstance].delegate goToVehicleArchivesVC];
        }
    }
}

@end
