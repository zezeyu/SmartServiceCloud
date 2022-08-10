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
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = cycleScrollViewHeight + 150;//预估高度而已
        [HZHomeVM instance].delegate = self;
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return self;
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
