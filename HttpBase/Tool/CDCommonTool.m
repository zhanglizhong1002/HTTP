//
//  CDCommonTool.m
//  eTianXia
//
//  Created by 陈浩 on 16/4/14.
//  Copyright © 2016年 PoBo_mac. All rights reserved.
//

#import "CDCommonTool.h"
#import "CHSettingTool.h"
// 费用小类个性化字段


@implementation CDCommonTool

#pragma mark - 保存翻译价格
+ (void)savePriceList:(NSArray* )priceList{
    if (!priceList.count)return;
    [CHSettingTool setObject:priceList forKey:@"priceList"];
}

#pragma mark - 获取翻译价格
+ (NSArray* )getPriceList{
    return [CHSettingTool objectForKey:@"priceList"];
}

#pragma mark - 设置当前登录状态
+ (void)setLogined:(BOOL)value{
    [CHSettingTool setObject:[NSNumber numberWithBool:value] forKey:@"isLogined"];
}

#pragma mark - 获得当前登录状态
+ (BOOL)getLogined{
    return [[CHSettingTool objectForKey:@"isLogined"] boolValue];
}

/*
#pragma mark - 保存用户信息
+ (void)saveUserInfo:(User* )model{
    if ([NSKeyedArchiver archiveRootObject:model toFile:CDUserInfo]){
        if (model.secretKey){
            [self saveUserToken:model.secretKey];
        }
        CDLog(@"保存成功！");
    }else{
        CDLog(@"保存失败！");
    }
}

#pragma mark - 获取用户信息
+ (User* )getUserInfo{
    User* model = [NSKeyedUnarchiver unarchiveObjectWithFile:CDUserInfo];
    return model;
}

*/
#pragma mark - 保存用户token
+ (void)saveUserToken:(NSString* )token{
    [CHSettingTool setObject:token forKey:@"userToken"];
}
#pragma mark - 获取用户token
+ (NSString* )getUserToken{
//    return [CHSettingTool objectForKey:@"userToken"];
    return @"c802b8fe137c38bc2ce4cda721c1a248";
}

#pragma mark - 封装SVProgressHUD的提示语
+ (void)showErrorWithStatus:(NSString* )status{
    [SVProgressHUD showErrorWithStatus:status];
}
+ (void)showWithStatus:(NSString* )status{
    [SVProgressHUD showWithStatus:status];
}
+ (void)showSuccessWithStatus:(NSString* )status{
    [SVProgressHUD showSuccessWithStatus:status];
}
+ (void)dismissHud{
    [SVProgressHUD dismiss];
}


@end
