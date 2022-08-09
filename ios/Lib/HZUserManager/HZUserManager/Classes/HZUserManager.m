//
//  HZUserManager.m
//  HZUserManager
//
//  Created by 何泽 on 2022/8/7.
//

#import "HZUserManager.h"
#import <HZOCLib/HZOCLib.h>
@implementation HZUserManager

+ (instancetype)instance{
    static HZUserManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HZUserManager alloc] init];
    });
    return _instance;
}

-(BOOL)isLogin{
    if ([UIImage getFaceImage]) {
        return YES;
    }
    return NO;
}

-(UIImage *)faceIdImage{
    return [UIImage getFaceImage];
}

@end
