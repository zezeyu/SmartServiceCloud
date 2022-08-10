//
//  HZLoginVC.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/5.
//

#import "HZLoginVC.h"
#import <HZFaceRecognition/CADFaceIDViewController.h>
#import <HZOCLib/HZOCLib.h>
#import <HZUserManager/HZUserManager.h>
#import <HZMedidator/HZMedidator.h>

@interface HZLoginVC ()

@property(nonatomic,strong)QMUIButton *loginButton;

@end

@implementation HZLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    weakify(self);
    [QMUIAlertController showAlertAttributes:@"登录" message:@"去登录一下吧~" cancelTitle:@"不想登录" defaultTitle:@"去登录" confirm:^(NSInteger buttonTag) {strongify(self);
        if (buttonTag) {
            [self goLogin];
        }
    }];
    self.loginButton.backgroundColor = UIColor.qd_tintColor;
}

#pragma -- 人脸识别
-(void)onClickLoginAction:(QMUIButton *)sender{
    [self goLogin];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)goLogin{
    CADFaceIDViewController *faceIDVC = [CADFaceIDViewController new];
    faceIDVC.title = @"刷脸登录";
    faceIDVC.faceImage = ^(UIImage * _Nonnull image) {
        [image saveFaceImage];
        if ([[HZMedidator shardInstance].delegate respondsToSelector:@selector(loadMainTabBar)]) {
            [[HZMedidator shardInstance].delegate loadMainTabBar];
            [QMUITips showSucceed:@"登录成功"];
        }
    };
    QDNavigationController * nav = [[QDNavigationController alloc]initWithRootViewController:faceIDVC];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}
-(QMUIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[QMUIButton alloc]init];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.cornerRadius = 35;
        [_loginButton setTitleColor:UIColorWhite forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(onClickLoginAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        weakify(self);
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            strongify(self);
            make.centerX.centerY.equalTo(self.view);
            make.width.height.mas_equalTo(@70);
        }];
    }
    return _loginButton;
}

@end
