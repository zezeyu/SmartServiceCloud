//
//  HZMineVC.m
//  HZMine
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMineVC.h"
#import "HZMineTopView.h"
#import <HZOCLib/HZOCLib.h>
#import "HZMineTableView.h"
@interface HZMineVC ()

@property (strong, nonatomic) HZMineTopView *topView;
@property (strong, nonatomic) HZMineTableView *tableView;

@end

@implementation HZMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    [self initUI];
}

-(void)initUI{
    [self.view addSubview:self.topView];
    weakify(self);
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.height.mas_equalTo(@200);
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(kTopHeight);
        }
    }];
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.topView.mas_bottom);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.mas_equalTo(kTabBarHeight);
        }
    }];
}

- (nullable UIImage *)qmui_navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:UIColor.qd_tintColor];
}

-(HZMineTopView *)topView{
    if (!_topView) {
        _topView = [[HZMineTopView alloc]init];
        _topView.backgroundColor = UIColor.qd_tintColor;
    }
    return _topView;
}
-(HZMineTableView *)tableView{
    if (!_tableView) {
        _tableView = [[HZMineTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
