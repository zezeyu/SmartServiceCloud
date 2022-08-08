//
//  HZMineTableView.m
//  HZMine
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMineTableView.h"
#import "QDThemeViewController.h"
@interface HZMineTableView()<QMUITableViewDelegate,QMUITableViewDataSource>

@property(nonatomic,copy)NSArray *dataArray;

@end
@implementation HZMineTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        _dataArray = @[@"github主页",@"自定义导航栏",@"切换主题",@"退出登录"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifierNormal = @"cellNormal";
    QMUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        cell = [[QMUITableViewCell alloc] initForTableView:tableView withStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
       NSURL *URL = [NSURL URLWithString:@"https://zezeyu.github.io/"];
        [[UIApplication sharedApplication]openURL:URL options:@{} completionHandler:nil];
    }
    if (indexPath.row == 2) {
        QDThemeViewController *vc = [[QDThemeViewController alloc]init];
        [[UIViewController currentViewController].navigationController pushViewController:vc animated:YES];
    }
}

@end
