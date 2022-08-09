
#import "JSONUtil.h"

@implementation JSONUtil

+(NSDictionary *)dictionaryWithNSData:(NSData *)data
{
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return dic;
}


+(NSArray *) arrayWithNSData:(NSData *) data
{
    NSError *error;
    NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"json解析失败：%@",error);
    }
    return array;
}


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [self dictionaryWithNSData:jsonData];
}


+(NSArray *) arrayWithJsonString:(NSString *) jsonstring
{
    if (!jsonstring) {
        return nil;
    }
    
    NSData *jsonData=[jsonstring dataUsingEncoding:NSUTF8StringEncoding];
    return [self arrayWithNSData:jsonData];
}


+(NSString *) jsonStringWithDict:(NSDictionary *) dict
{
    NSError *error;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"字典转json字符串失败：%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return [mutStr copy];
}


+(NSString *) jsonStringWithArray:(NSArray *) array
{
    NSError *error;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"数组转json字符串失败：%@",error);
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

}

+ (id)requestDataWithName:(NSString *)jsonName{
    
    //获取路径  拿到的是 传递进来的 json文件的路径
    NSString * path = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    
    //存到 data对象中
    NSData * data = [NSData dataWithContentsOfFile:path];
    
    //解析 data
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return jsonData;
}



+(NSString *) jsonStringWithObject:(id )obj
{
    NSError *error;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"字典转json字符串失败：%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return [mutStr copy];
}



+(nullable id)jsonParseWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return jsonObject;

}


@end
