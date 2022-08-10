//
//  HZHomeRecommendSongView.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeRecommendSongView.h"
#import "HZRecommendSongCell.h"
@interface HZHomeRecommendSongListCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)QMUILabel *recommendLabel;

@property(nonatomic,strong)QMUIButton *moreButton;

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic,strong)UIView *separatorView;

@end

@implementation HZHomeRecommendSongListCell

- (instancetype)initForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initForTableView:tableView withStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self.contentView addSubview:self.separatorView];
    weakify(self);
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.left.right.top.equalTo(self);
        if ([self.reuseIdentifier isEqualToString:@"HZHomeRecommendSongListCell"]) {
            make.height.mas_equalTo(@1);
        }else{
            make.height.mas_equalTo(@10);
        }
    }];
    [self.contentView addSubview:self.recommendLabel];
    [_recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(home_interval);
        make.top.mas_equalTo(@25);
    }];
    [self.contentView addSubview:self.moreButton];
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.right.mas_equalTo(-home_interval);
        make.width.mas_equalTo(@65);
        make.height.mas_equalTo(@30);
        make.centerY.mas_equalTo(self.recommendLabel.mas_centerY);
    }];
    [self.contentView addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.top.mas_equalTo(self.recommendLabel.mas_bottom).offset(home_interval);
        make.left.right.mas_equalTo(@0);
        make.height.mas_equalTo(@200);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-home_interval);
    }];
}
#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [HZHomeVM instance].recommendSongs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HZRecommendSongCell *cell = (HZRecommendSongCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"HZRecommendSongCell" forIndexPath:indexPath];
    cell.model = [HZHomeVM instance].recommendSongs[indexPath.item];
    return cell;
}
#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(155, 200);
}

-(QMUILabel *)recommendLabel{
    if (!_recommendLabel) {
        _recommendLabel = [[QMUILabel alloc]init];
        _recommendLabel.text = @"推荐歌单";
        _recommendLabel.textColor = UIColor.qd_mainTextColor;
        _recommendLabel.font = UIFontBoldMake(20);
    }
    return _recommendLabel;
}

-(QMUIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [[QMUIButton alloc]init];
        _moreButton.text = @"更多 >";
        [_moreButton setTitleColor:UIColor.qd_mainTextColor forState:UIControlStateNormal];
        _moreButton.titleLabel.font = TEXT_FONT;
        _moreButton.borderWidth = 1;
        _moreButton.cornerRadius = 15;
        _moreButton.borderColor = UIColor.qd_separatorColor;
    }
    return _moreButton;
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
        [_collectionView registerClass:[HZRecommendSongCell class] forCellWithReuseIdentifier:@"HZRecommendSongCell"];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}
-(UIView *)separatorView{
    if (!_separatorView) {
        _separatorView = [[UIView alloc]init];
        _separatorView.backgroundColor = UIColor.qd_separatorColor;
    }
    return _separatorView;
}

@end
