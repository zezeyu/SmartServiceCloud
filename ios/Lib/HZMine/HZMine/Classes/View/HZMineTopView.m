//
//  HZMineTopView.m
//  HZMine
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMineTopView.h"
#import <HZOCLib/HZOCLib.h>
@interface HZMineTopView()

@property(nonatomic,strong)QMUILabel *nickNameLabel;
@property(nonatomic,strong)QMUILabel *occupationLabel;
@property(nonatomic,strong)UIImageView *imageView;

@end
@implementation HZMineTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    [self addSubview:self.imageView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.occupationLabel];
    weakify(self);
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(30);
        make.width.height.mas_equalTo(@100);
    }];
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {strongify(self);
        make.centerY.equalTo(self).offset(-15);
        make.left.mas_equalTo(self.imageView.mas_right).offset(15);
    }];
    [_occupationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(15);
        make.left.mas_equalTo(self.imageView.mas_right).offset(15);
    }];
}

-(QMUILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel = [[QMUILabel alloc]init];
        _nickNameLabel.text = @"昵称：今年有望当村长";
        _nickNameLabel.font = UIFontBoldMake(17);
        _nickNameLabel.textColor = UIColorWhite;
    }
    return _nickNameLabel;
}
-(QMUILabel *)occupationLabel{
    if (!_occupationLabel) {
        _occupationLabel = [[QMUILabel alloc]init];
        _occupationLabel.text = @"职业：搬砖工人";
        _occupationLabel.font = UIFontBoldMake(17);
        _occupationLabel.textColor = UIColorWhite;
    }
    return _occupationLabel;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = UIImageMake(@"daitu.jpg");
        _imageView.layer.masksToBounds = YES;
        _imageView.cornerRadius = 50;
        
    }
    return _imageView;;
}
@end
