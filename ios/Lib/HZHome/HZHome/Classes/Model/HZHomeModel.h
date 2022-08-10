//
//  HZHomeModel.h
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HZHomeMenuModel;
@class HZHomeRecommendSondModel;
@interface HZHomeModel : NSObject

@property(nonatomic,copy)NSArray *imagesURLStrings;

@property(nonatomic,copy)NSArray <HZHomeMenuModel *>*menuData;

@property(nonatomic,copy)NSArray <HZHomeRecommendSondModel *>*songList;

@end

@interface HZHomeMenuModel : NSObject

/***菜单的图片*/
@property(nonatomic,copy)NSString *menuImage;
/***菜单的title*/
@property(nonatomic,copy)NSString *menuTitle;

@end

@interface HZHomeRecommendSondModel : NSObject

@property(nonatomic,copy)NSString *image;

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *amountOfPlay;

@end

NS_ASSUME_NONNULL_END
