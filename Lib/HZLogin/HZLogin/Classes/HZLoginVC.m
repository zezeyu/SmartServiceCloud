//
//  HZLoginVC.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/5.
//

#import "HZLoginVC.h"
#import <HZFaceRecognition/CADFaceIDViewController.h>
#import <HZOCLib/HZOCLib.h>
@interface HZLoginVC ()

@property(nonatomic,strong)QMUIButton *loginButton;

@end

@implementation HZLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.backgroundColor = UIColor.qd_tintColor;
}

#pragma -- 人脸识别
-(void)onClickLoginAction:(QMUIButton *)sender{
    CADFaceIDViewController *faceIDVC = [CADFaceIDViewController new];
    faceIDVC.title = @"刷脸登录";
    QDNavigationController * nav = [[QDNavigationController alloc]initWithRootViewController:faceIDVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

-(QMUIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[QMUIButton alloc]init];
        _loginButton.text = @"登录";
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
