//
//  CDTool.m
//  UQIGOU
//
//  Created by 陈浩 on 16/3/11.
//  Copyright © 2016年 HEM. All rights reserved.
//

#import "CDTool.h"
#import "CommonCrypto/CommonDigest.h"

@implementation CDTool

#pragma mark - 更新版本
+ (void)updateAppVersion:(NSString *)url{
    NSURL *iTunesURL = [NSURL URLWithString:url];
    [[UIApplication sharedApplication] openURL:iTunesURL];
}

#pragma mark - 时间戳(单位:ms)转时间 "yyyy-MM-dd HH:mm:ss"
+ (NSString* )getTimeByTimespan:(NSString* )timespan accurateSecond:(BOOL)accurate{
    if (timespan.length >= 11) {
        timespan = [timespan substringToIndex:(timespan.length - 3)];
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    NSDate *createDate = [NSDate dateWithTimeIntervalSince1970:[timespan integerValue]];
    fmt.dateFormat = accurate ? @"yyyy-MM-dd HH:mm" : @"yyyy-MM-dd";
    NSString* time = [fmt stringFromDate:createDate];
    //    CHLog(@"timespan-- %@",timespan);
    return time;
}

#pragma mark - md5加密
+ (NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

#pragma mark - 是否空字符串
+ (BOOL)isEmptyString:(NSString* )text{
    if (text == nil || text == NULL){
        return YES;
    }
    if ([text isKindOfClass:[NSNull class]]){
        return YES;
    }
    if (!text.length){
        return YES;
    }
    return NO;
}

#pragma mark - 获取加密后的信息
+ (NSString *)getSecretString:(NSString *)text{
    NSMutableString *secretStr = [[NSMutableString  alloc] initWithString:text];
    [secretStr replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return secretStr;
}

#pragma mark - 判断服务器是否合理
+ (BOOL)isSuccessResponse:(id)responseObject{
    NSDictionary *dic;
    if([responseObject isKindOfClass:[NSData class]]){
        NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        dic = [self jsonStringToDictionary:jsonString];
//        return true;
    }else
        dic = (NSDictionary *)responseObject;
    
    if([[dic allKeys] containsObject:@"resultCode"] && [[dic objectForKey:@"resultCode"] integerValue] == 0){
        return true;
    }else if ([[dic allKeys] containsObject:@"code"] && [[dic objectForKey:@"code"] integerValue] == 0){
        return true;
    }else{
        NSString *msg = @"";
        if ([[dic allKeys] containsObject:@"resultMessage"]){
            msg = [dic objectForKey:@"resultMessage"];
        }else if ([[dic allKeys] containsObject:@"msg"]){
            msg = [dic objectForKey:@"msg"];
        }
//        [CDCommonTool dismissHud];

        [CDCommonTool showErrorWithStatus:msg];
        return false;
    }
}

#pragma mark - 将传入的字符串转换成字典
+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonString{
    NSDictionary *dictionary = nil;
    NSError *error;
    NSData *jsonData =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    if(!dictionary)
        NSLog(@"jsonStringTOdictionary ERROR:%@",error);
    return dictionary;
}

#pragma mark - 将传入的字典id类型转换成字符串
+ (NSString *)dataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    
    if(jsonData)
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        NSLog(@"dataTOjsonString ERROR:%@",error);
    
    //空格和\n在有些第三方东西中有些问题
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""]; //去空格
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""]; //去\n
    return jsonString;
}

@end
