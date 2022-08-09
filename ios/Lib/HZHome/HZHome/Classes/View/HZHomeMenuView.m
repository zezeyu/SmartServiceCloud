//
//  HZHomeMenuView.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeMenuView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "HZHomeSongCell.h"

@interface HZHomeMenuViewCell()<SDCycleScrollViewDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong, readonly) QMUICollectionViewPagingLayout *collectionViewLayout;

@end

@implementation HZHomeMenuViewCell

- (instancetype)initForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initForTableView:tableView withStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _collectionViewLayout = [[QMUICollectionViewPagingLayout alloc] initWithStyle:QMUICollectionViewPagingLayoutStyleDefault];
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
    [self addSubview:self.cycleScrollView];
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(cycleScrollInterval);
        make.right.mas_equalTo(-cycleScrollInterval);
        make.height.mas_equalTo(cycleScrollViewHeight);
    }];
//    [self addSubview:self.collectionView];
//    weakify(self);
//    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
//        make.top.mas_equalTo(self.cycleScrollView.mas_bottom);
//        make.left.right.mas_equalTo(@0);
//        make.height.mas_equalTo(@200);
//    }];
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
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.collectionViewLayout];
        _collectionView.backgroundColor = UIColorClear;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HZHomeSongCell class] forCellWithReuseIdentifier:@"SongCell"];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HZHomeSongCell *cell = (HZHomeSongCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.collectionViewLayout.debug) {
        return CGSizeMake(100, 100);
    }
    
    if (@available(iOS 11.0, *)) {
        CGSize size = CGSizeMake(CGRectGetWidth(collectionView.bounds) - UIEdgeInsetsGetHorizontalValue(self.collectionViewLayout.sectionInset) - UIEdgeInsetsGetHorizontalValue(self.collectionView.adjustedContentInset), CGRectGetHeight(collectionView.bounds) - UIEdgeInsetsGetVerticalValue(self.collectionViewLayout.sectionInset) - UIEdgeInsetsGetVerticalValue(self.collectionView.adjustedContentInset));
        return size;
    }
    return CGSizeMake(100, 100);
}

@end
