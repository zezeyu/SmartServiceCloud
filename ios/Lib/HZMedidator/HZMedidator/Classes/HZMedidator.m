//
//  HZMedidator.m
//  HZMedidator
//
//  Created by 何泽 on 2022/8/8.
//

#import "HZMedidator.h"
#import <HZOCLib/HZOCLib.h>
#import <HZUserManager/HZUserManager.h>

@implementation HZMedidator

+(instancetype)shardInstance{
    static HZMedidator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[HZMedidator alloc]init];
    });
    return mediator;
}

@end
