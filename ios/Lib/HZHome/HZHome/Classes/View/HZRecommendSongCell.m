//
//  HZRecommendSongCell.m
//  HZHome
//
//  Created by 何泽 on 2022/8/10.
//

#import "HZRecommendSongCell.h"
#import "HZHomeModel.h"
#import <SDWebImage/SDWebImage.h>
@interface HZRecommendSongCell()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)QMUILabel *titleLabel;
@property(nonatomic,strong)QMUIButton *vvButon;

@end
@implementation HZRecommendSongCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)setSelected:(BOOL)selected{
    _titleLabel.backgroundColor = UIColor.clearColor;
}
-(void)initUI{
    [self.contentView addSubview:self.imageView];
    weakify(self);
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.top.right.equalTo(self.contentView);
        make.left.mas_equalTo(@15);
        make.height.mas_equalTo(@140);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(5);
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.imageView);
    }];
}

-(void)setModel:(HZHomeRecommendSondModel *)model{
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:UIImageMake(@"")];
    _titleLabel.text = model.title;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.cornerRadius = home_interval;
    }
    return _imageView;
}

-(QMUILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[QMUILabel alloc]init];
        _titleLabel.textColor = UIColor.qd_mainTextColor;
        _titleLabel.font = TEXT_FONT;
        _titleLabel.numberOfLines = 2;
        _titleLabel.backgroundColor = UIColor.clearColor;
    }
    return _titleLabel;
}

@end
