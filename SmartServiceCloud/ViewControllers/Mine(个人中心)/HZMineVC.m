//
//  HZMineVC.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "HZMineVC.h"

@interface HZMineVC ()

@end

@implementation HZMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
}

- (nullable UIImage *)qmui_navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:[UIColor grayColor]];
}

@end
