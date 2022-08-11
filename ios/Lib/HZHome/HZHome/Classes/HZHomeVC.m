//
//  HZHomeVC.m
//  HZHome
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZHomeVC.h"
#import "HZHomeVM.h"
#import "HZHomeView.h"
@interface HZHomeVC ()
@property(nonatomic,strong)QMUINavigationButton *leftButton;//目录
@property(nonatomic,strong)QMUINavigationButton *rightButton;//话筒
@property(nonatomic,strong)QMUISearchBar *searchBar;
@property(nonatomic,strong)HZHomeView *homeView;
@property(nonatomic, strong) QMUIPopupMenuView *popupByWindow;
@end

@implementation HZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeDidChangeNotification:) name:QMUIThemeDidChangeNotification object:nil]; //因为首页布局特殊，切换主题后需要刷新tabelview上的UICollectionView
    
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
#pragma --mark 管家事件回调  我们可以拿到回调后,做一些对ui上的处理啥的
-(void)loadManagerEventBlock{
    weakify(self);
    [[HZHomeVM instance]home_ManagerEvent_Block:^(home_ManagerEvent event) {strongify(self);
        if (event == cycleScrollDataComplete) {//轮播图加载完成
            [self.homeView reloadData];
        }
        if (event == menuDataComplete) {//菜单数据加载完成
            
        }
        if (event == recommendSongListComplete) {//歌单加载完成
            
        }
    }];
}

- (nullable UIImage *)qmui_navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:self.view.backgroundColor];
}

#pragma --mark 方法实现
-(void)onClickDirectory{
    
}
-(void)onClickMicrophone{
    
}
- (void)handleThemeDidChangeNotification:(NSNotification *)notification {
    if ([[HZHomeVM instance].delegate respondsToSelector:@selector(reloadTableView)]) {
        [[HZHomeVM instance].delegate reloadTableView];
    }
    if ([[HZHomeVM instance].delegate respondsToSelector:@selector(reloadCollectionView)]) {
        [[HZHomeVM instance].delegate reloadCollectionView];
    }
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
