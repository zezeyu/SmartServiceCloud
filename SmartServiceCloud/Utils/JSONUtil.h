
#import <Foundation/Foundation.h>

@interface JSONUtil : NSObject
/**
 *  将NSData转换成字典
 *
 *  @param data 数据
 *
 *  @return 返回字典
 */
+ (NSDictionary *)dictionaryWithNSData:(NSData *)data;


/**
 *  将NSData转换成数组
 *
 *  @param data 数据
 *
 *  @return 返回数组
 */
+(NSArray *) arrayWithNSData:(NSData *) data;


/**
 *  把JSON格式的字符串转换成字典
 *
 *  @param jsonString JSON格式的字符串
 *
 *  @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  将json字符串转化成数组
 *
 *  @param jsonstring jsonz字符串
 *
 *  @return 返回数组
 */
+(NSArray *) arrayWithJsonString:(NSString *) jsonstring;

/**
 *  将字典转化成json字符串
 *
 *  @param dict 字典
 *
 *  @return 返回json字符串
 */
+(NSString *) jsonStringWithDict:(NSDictionary *) dict;

/**
 *  将数组转化成json字符串
 *
 *  @param array 数组
 *
 *  @return 返回json字符串
 */
+(NSString *) jsonStringWithArray:(NSArray *) array;
/**解析本地json*/
+ (id)requestDataWithName:(NSString *)jsonName;


+(NSString *) jsonStringWithObject:(id )obj;

+(nullable id)jsonParseWithJsonString:(NSString *)jsonString;

@end
