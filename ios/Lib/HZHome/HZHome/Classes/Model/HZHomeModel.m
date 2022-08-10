//
//  HZHomeModel.m
//  AFNetworking
//
//  Created by 何泽 on 2022/8/9.
//

#import "HZHomeModel.h"

@implementation HZHomeModel

-(NSArray *)imagesURLStrings{
    return @[
      @"https://p1.music.126.net/Ixxbo4S7kWs5W2oKyQxFeg==/109951167761074218.jpg?imageView&quality=89",
      @"https://p1.music.126.net/NP3CajTha8lJl9zlaULL-g==/109951167760714127.jpg?imageView&quality=89",
      @"https://p1.music.126.net/rq1tT7PdJqnClNRBaZpA6Q==/109951167762023949.jpg?imageView&quality=89",
      @"https://p1.music.126.net/YkHHt3JWm78j7OZeQX_aTA==/109951167761102892.jpg?imageView&quality=89",
      @"https://p1.music.126.net/Kz7lZG7moFGQN86zfEKqxw==/109951167760737597.jpg?imageView&quality=89",
      @"https://p1.music.126.net/6LicJxLc0wNrXqKk4m_xMw==/109951167760848468.jpg?imageView&quality=89"
    ];
}

MJCodingImplementation
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"menuData" : [HZHomeMenuModel class],@"songList" : [HZHomeRecommendSondModel class]};
}

@end


@implementation HZHomeMenuModel


@end


@implementation HZHomeRecommendSondModel


@end
