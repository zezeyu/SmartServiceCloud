//
//  HZTestVC.m
//  SmartServiceCloud
//
//  Created by 何泽 on 2022/7/22.
//

#import "HZTestVC.h"

@interface HZTestVC ()

@end

@implementation HZTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"透明导航栏";
    self.view.backgroundColor = [UIColor purpleColor];
}

#pragma mark - QMUINavigationControllerDelegate
- (nullable UIImage *)qmui_navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:[UIColor clearColor]];
}

@end
