//
//  UIView+HZUtil.m
//  ArcGISTest
//
//  Created by 何泽的mac on 2019/5/8.
//  Copyright © 2019 何泽的mac. All rights reserved.
//

#import "UIView+HZUtil.h"

@implementation UIView (HZUtil)
@dynamic cornerRadius,bolderColor,bolderWidth;
-(void)addTapGestureTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:singleRecognizer];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

-(void)setBolderColor:(UIColor *)bolderColor{
    self.layer.borderColor = bolderColor.CGColor;
}

-(void)setBolderWidth:(CGFloat)bolderWidth{
    self.layer.borderWidth = bolderWidth;
}

@end

@implementation UITableViewCell (HZUtil)

+ (id)cellWithTableView:(UITableView *)tableView
{
    NSString *Identifier = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:Identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:Identifier];
    return [tableView dequeueReusableCellWithIdentifier:Identifier];
}

@end
