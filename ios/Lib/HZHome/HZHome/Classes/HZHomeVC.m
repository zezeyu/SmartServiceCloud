//
//  HZHomeVC.m
//  HZHome
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZHomeVC.h"
#import <HZOCLib/HZOCLib.h>
#import <HZMedidator/HZMedidator.h>
#import "HZHomeVM.h"
#import "HZHomeView.h"
@interface HZHomeVC ()
@property(nonatomic,strong)QMUINavigationButton *leftButton;//目录
@property(nonatomic,strong)QMUINavigationButton *rightButton;//话筒
@property(nonatomic,strong)QMUISearchBar *searchBar;
@property(nonatomic,strong)HZHomeView *homeView;
@end

@implementation HZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self initUI];
    //注册管家事件回调
    [self loadManagerEventBlock];
    //让管家去拿数据
    [[HZHomeVM instance]loadData];
}

-(void)initNavigationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem qmui_itemWithButton:self.leftButton target:self action:@selector(onClickDirectory)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem qmui_itemWithButton:self.rightButton target:self action:@selector(onClickMicrophone)];
    self.navigationItem.titleView = self.searchBar;
}

-(void)initUI{
    [self.view addSubview:self.homeView];
    [_homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NavigationContentTop);
        make.left.right.bottom.equalTo(self.view);
    }];
}

-(void)loadManagerEventBlock{
    weakify(self);
    [[HZHomeVM instance]home_ManagerEvent_Block:^(home_ManagerEvent event) {strongify(self);
        if (event == cycleScrollDataComplete) {
            [self.homeView reloadData];
        }
    }];
}

- (nullable UIImage *)qmui_navigationBarBackgroundImage{
    if ([QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier isEqual:QDThemeIdentifierDark]) {
        return [UIImage qmui_imageWithColor:self.view.backgroundColor];
    }
    return [UIImage qmui_imageWithColor:UIColor.whiteColor];
}

#pragma --mark 方法实现
-(void)onClickDirectory{
    
}
-(void)onClickMicrophone{
    
}
#pragma --mark 懒加载
-(QMUINavigationButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[QMUINavigationButton alloc]initWithImage:[UIImage svgImageNamed:@"hz_directory_icon" size:CGSizeMake(30, 30) objColor:UIColor.qd_iconColor]];
    }
    return _leftButton;
}

-(QMUINavigationButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[QMUINavigationButton alloc]initWithImage:[UIImage svgImageNamed:@"hz_microphone" size:CGSizeMake(30, 30) objColor:UIColor.qd_iconColor]];
    }
    return _rightButton;
}

-(QMUISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[QMUISearchBar alloc]init];
        _searchBar.placeholder = @"周杰伦";
    }
    return _searchBar;
}
-(HZHomeView *)homeView{
    if (!_homeView) {
        _homeView = [[HZHomeView alloc]init];
    }
    return _homeView;
}
@end
