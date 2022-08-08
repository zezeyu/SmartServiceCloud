//
//  HZUserManager.h
//  HZUserManager
//
//  Created by 何泽 on 2022/8/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZUserManager : NSObject

+ (instancetype)instance;
/***是否进行登录过*/
@property(nonatomic,assign,readonly)BOOL isLogin;
/***用户的人脸照片*/
@property(nonatomic,copy,readonly)UIImage *faceIdImage;

@end

NS_ASSUME_NONNULL_END
