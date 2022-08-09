//
//  HZHomeView.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeView.h"
#import "HZHomeMenuView.h"
#import "HZHomeVM.h"
@interface HZHomeView()<QMUITableViewDelegate,QMUITableViewDataSource>

@end
@implementation HZHomeView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cycleScrollViewHeight + 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifierNormal = @"HZHomeMenuViewCell";
    HZHomeMenuViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        cell = [[HZHomeMenuViewCell alloc] initForTableView:tableView withStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
    }
    HZHomeModel *model = [HZHomeModel new];
    model.imagesURLStrings = [HZHomeVM instance].imagesURLStrings;
    cell.model = model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
