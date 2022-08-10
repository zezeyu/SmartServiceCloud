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

@end

NS_ASSUME_NONNULL_END
