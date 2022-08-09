//
//  HZMedidator.h
//  HZMedidator
//
//  Created by 何泽 on 2022/8/8.
//

#import <Foundation/Foundation.h>
#import "MedidatorDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZMedidator : NSObject

@property (nonatomic,weak) id <MedidatorDelegate> delegate;

+ (instancetype)shardInstance;

-(void)initAppWithWindow:(UIWindow *)window;

-(void)loadLoginVC:(UIWindow *)window;

-(void)loadMainTabBar:(UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
