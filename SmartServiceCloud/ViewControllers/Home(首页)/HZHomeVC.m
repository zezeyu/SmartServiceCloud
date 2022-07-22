//
//  HZHomeVC.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "HZHomeVC.h"
#import "HZTestVC.h"
@interface HZHomeVC ()

@end

@implementation HZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [QMUIAlertController showAlertAttributes:@"主题弹窗" message:@"屌不屌" cancelTitle:@"取消" defaultTitle:@"确定" confirm:^(NSInteger buttonTag) {
        if (buttonTag) {
            HZTestVC * testVC = [[HZTestVC alloc]init];
            [self.navigationController pushViewController:testVC animated:YES];
        }
    }];
}



@end
