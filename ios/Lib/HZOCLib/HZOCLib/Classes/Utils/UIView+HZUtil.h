//
//  UIView+HZUtil.h
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/5/8.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HZUtil)

@property(nonatomic,assign)IBInspectable CGFloat cornerRadius;
@property(nonatomic,assign)IBInspectable UIColor *borderColor;
@property(nonatomic,assign)IBInspectable CGFloat borderWidth;

-(void)addTapGestureTarget:(id)target action:(SEL)action;

@end

@interface UITableViewCell (HZUtil)

+ (id)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
