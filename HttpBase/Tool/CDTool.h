//
//  CDTool.h
//  UQIGOU
//
//  Created by 陈浩 on 16/3/11.
//  Copyright © 2016年 HEM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDTool : NSObject

#pragma mark - 更新版本
+ (void)updateAppVersion:(NSString *)url;

#pragma mark - 时间戳(单位:ms)转时间 "yyyy-MM-dd HH:mm:ss" accurate:是否精确到秒
+ (NSString* )getTimeByTimespan:(NSString* )timespan accurateSecond:(BOOL)accurate;

#pragma mark - md5加密
+(NSString *) md5: (NSString *) inPutText;

#pragma mark - 是否空字符串
+ (BOOL)isEmptyString:(NSString* )text;

#pragma mark - 获取加密后的信息
+ (NSString* )getSecretString:(NSString* )text;

#pragma mark - 判断服务器是否合理
+ (BOOL)isSuccessResponse:(id)responseObject;

#pragma mark - 将传入的字符串转换成字典
+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonString;

#pragma mark - 将传入的字典id类型转换成字符串
+ (NSString *)dataTOjsonString:(id)object;

@end
