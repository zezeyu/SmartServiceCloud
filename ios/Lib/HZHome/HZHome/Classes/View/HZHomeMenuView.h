//
//  HZHomeMenuView.h
//  HZHome
//
//  Created by 何泽 on 2022/8/9.
//

#import <UIKit/UIKit.h>

#import "HZHomeModel.h"

#define cycleScrollViewHeight (kScreenWidth - home_interval * 2) * 142 / 365
NS_ASSUME_NONNULL_BEGIN

@interface HZHomeMenuViewCell : QMUITableViewCell

@property(nonatomic,strong)HZHomeModel *model;

@end

NS_ASSUME_NONNULL_END
