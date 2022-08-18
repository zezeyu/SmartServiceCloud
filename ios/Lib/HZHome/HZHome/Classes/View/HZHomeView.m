//
//  HZHomeView.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeView.h"
#import "HZHomeMenuView.h"
#import "HZHomeRecommendSongView.h"
#import "HZHomeVM.h"
@interface HZHomeView()<QMUITableViewDelegate,QMUITableViewDataSource,HZHomeVMDelegate>

@end
@implementation HZHomeView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = UIColor.qd_separatorColor;
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = cycleScrollViewHeight + 150;//预估高度而已
        [HZHomeVM instance].delegate = self;
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return self;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 1;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *identifierNormal = @"HZHomeMenuViewCell";
            HZHomeMenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
            if (!cell) {
                cell = [[HZHomeMenuViewCell alloc] initForTableView:tableView withStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            HZHomeModel *model = [HZHomeModel new];
            model.imagesURLStrings = [HZHomeVM instance].imagesURLStrings;
            cell.model = model;
            return cell;
        }
        if (indexPath.row == 1) {
            static NSString *identifierNormal = @"HZHomeRecommendSongListCell";
            HZHomeRecommendSongListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
            if (!cell) {
                cell = [[HZHomeRecommendSongListCell alloc] initForTableView:tableView withStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.cornerRadius = home_interval;
            if (@available(iOS 11.0, *)) {
                cell.layer.maskedCorners = QMUILayerMinXMaxYCorner | QMUILayerMaxXMaxYCorner;
            }
            return cell;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            static NSString *identifierNormal = @"HZHomeRecommendSongListCell2";
            HZHomeRecommendSongListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
            if (!cell) {
                cell = [[HZHomeRecommendSongListCell alloc] initForTableView:tableView withStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.cornerRadius = home_interval;
            if (@available(iOS 11.0, *)) {
                cell.layer.maskedCorners = QMUILayerMinXMinYCorner | QMUILayerMaxXMinYCorner;
            }
            return cell;
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)reloadTableView{
    [self reloadData];
    [self layoutIfNeeded];
}

@end
