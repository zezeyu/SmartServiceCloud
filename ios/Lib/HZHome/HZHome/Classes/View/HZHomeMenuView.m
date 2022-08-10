//
//  HZHomeMenuView.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeMenuView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "HZHomeSongCell.h"

@interface HZHomeMenuViewCell()<SDCycleScrollViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,HZHomeVMDelegate>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HZHomeMenuViewCell

- (instancetype)initForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initForTableView:tableView withStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [HZHomeVM instance].delegate = self;
        [self initUI];
    }
    return self;
}

-(void)setModel:(HZHomeModel *)model{
    //采用网络图片
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         self.cycleScrollView.imageURLStringsGroup = model.imagesURLStrings;
    });
}

-(void)initUI{
    [self.contentView addSubview:self.cycleScrollView];
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@10);
        make.left.mas_equalTo(home_interval);
        make.right.mas_equalTo(-home_interval);
        make.height.mas_equalTo(cycleScrollViewHeight);
    }];
    [self.contentView addSubview:self.collectionView];
    weakify(self);
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).offset(home_interval);
        make.left.right.mas_equalTo(@0);
        make.height.mas_equalTo(@100);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}



-(SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:UIImageMake(@"placeholder")];
        _cycleScrollView.cornerRadius = MainCorner;
    }
    return _cycleScrollView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColorClear;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HZHomeSongCell class] forCellWithReuseIdentifier:@"HZHomeSongCell"];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [HZHomeVM instance].menus.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HZHomeSongCell *cell = (HZHomeSongCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"HZHomeSongCell" forIndexPath:indexPath];
    cell.model = [HZHomeVM instance].menus[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(88, 100);
}

- (void)reloadCollectionView {
    [_collectionView reloadData];
}



@end
