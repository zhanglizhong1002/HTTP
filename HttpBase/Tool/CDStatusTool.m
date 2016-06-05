//
//  CDStatusTool.m
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import "CDStatusTool.h"
#import "CDBaseParseJson.h"
#import "CDUserCenter.h"


@implementation CDStatusTool


#pragma mark - 获取通知消息
+ (void)getNoticeSuccess:(void (^)(CDUserCenter* result))success failure:(void (^)(NSError *error))failure{
    [CDCommonTool showWithStatus:@"数据加载中"];
    [CDBaseParseJson postWithURL:kGetUserNoticeMessageUrl params:nil success:^(id json) {
        [CDCommonTool dismissHud];
        NSDictionary* dict = [self getDictByJson:json withTitle:@"个人中心"];
        CDLog(@"个人中心  %@",dict);
        
        if ([CDTool isSuccessResponse:json]){
            CDUserCenter* result = [CDUserCenter mj_objectWithKeyValues:json];
            CDLog(@"%@",result.mj_keyValues);

            if (success){
                success(result);
            }
        }
    } failure:^(NSError *error) {
        [CDCommonTool dismissHud];
        [CDCommonTool showErrorWithStatus:@"数据加载失败"];
    }];
}

#pragma mark - 解析传入的网络数据
+ (NSDictionary* )getDictByJson:(id )json{
    return [self getDictByJson:json withTitle:nil];
}

#pragma mark - 解析传入的网络数据
+ (NSDictionary* )getDictByJson:(id )json withTitle:(NSString* )title
{
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:json options:0 error:nil];
    //    [CommonUtilityClass isSuccessResponse:dict];
    CDLog(@"解析 %@ 的网络数据  %@",title,dict);
    return dict;
}

#pragma mark - 获取最新版本
+ (void)getLastVersionSuccess:(void (^)(CDVersionModel* result))success failure:(void (^) (NSError* error))failure{
    [CDBaseParseJson postWithURL:kBindCustomInfoRequestUrl params:nil success:^(id json) {
        NSDictionary* dict = [self getDictByJson:json withTitle:@"获取最新版本"];
        CDLog(@"获取最新版本  %@",dict);
        if ([CDTool isSuccessResponse:json]){
            CDVersionModel* result = [CDVersionModel mj_objectWithKeyValues:dict[@"datas"]];
            if (success){
                success(result);
            }
        }else{
            if (success){
                success(nil);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
