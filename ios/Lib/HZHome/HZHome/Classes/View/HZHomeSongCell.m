//
//  HZHomeSongCell.m
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeSongCell.h"
#import "HZHomeModel.h"
@interface HZHomeSongCell()

@property(nonatomic,strong)UIImageView *menuImageView;
@property(nonatomic,strong)UILabel *menuTitleLabel;

@end

@implementation HZHomeSongCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.menuImageView];
        [_menuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(@60);
            make.centerY.equalTo(self).offset(-15);
            make.centerX.equalTo(self);
        }];
        [self addSubview:self.menuTitleLabel];
        [_menuTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(home_interval);
            make.right.mas_equalTo(-home_interval);
            make.centerY.equalTo(self).offset(30);
        }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected{
    _menuTitleLabel.backgroundColor = UIColor.clearColor;
}
-(void)setModel:(HZHomeMenuModel *)model{
    _model = model;
    UIImage *image = [UIImage svgImageNamed:model.menuImage size:CGSizeMake(30, 30) objColor:UIColor.qd_tintColor];
    _menuImageView.image = image;
    _menuTitleLabel.text = model.menuTitle;
    _menuImageView.backgroundColor = [UIColor.qd_tintColor colorWithAlphaComponent:[QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier isEqual:QDThemeIdentifierDark]?0.3:0.1];
}

-(UIImageView *)menuImageView{
    if (!_menuImageView) {
        _menuImageView = [[UIImageView alloc]init];
        _menuImageView.contentMode = UIViewContentModeCenter;
        _menuImageView.cornerRadius = 30;
    }
    return _menuImageView;
}

-(UILabel *)menuTitleLabel{
    if (!_menuTitleLabel) {
        _menuTitleLabel = [[QMUILabel alloc]init];
        _menuTitleLabel.textAlignment = NSTextAlignmentCenter;
        _menuTitleLabel.textColor = UIColor.qd_titleTextColor;
        _menuTitleLabel.backgroundColor = UIColor.clearColor;
        _menuTitleLabel.font = TEXT_FONT;
    }
    return _menuTitleLabel;
}

@end
