//
//  CADFaceIDViewController.h
//  cheanda
//
//  Created by 何泽的mac on 2018/12/14.
//  Copyright © 2018年 车安达. All rights reserved.
//

#import <HZOCLib/HZOCLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface CADFaceIDViewController : QDCommonViewController

typedef void (^faceImageBlcok)(UIImage *);

@property (nonatomic,copy)faceImageBlcok faceImage;
/**是不是签到的人脸识别*/
@property (nonatomic,assign)BOOL isSignIn;

@property (nonatomic,strong)NSString * trainId;
@property (nonatomic,strong)NSString * trainLat;
@property (nonatomic,strong)NSString * trainLng;
@property (nonatomic,strong)NSString * trainLocation;
@property (nonatomic,strong)NSString * signType;
@end

NS_ASSUME_NONNULL_END
