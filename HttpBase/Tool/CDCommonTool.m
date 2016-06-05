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
#define CDUserInfo [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"UserInfo.plist"]
#define CDTranslateUserInfo [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"TranslateUserInfo.plist"]

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

#pragma mark - 保存翻译起步时长数据
+ (void)saveLanguageCategory:(NSArray* )category duration:(NSArray* )duration{
    if (category.count && (category.count != duration.count))return;
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    for (int i = 0 ; i < category.count ; i ++){
        NSString* categoryStr = [categoryArray objectAtIndex:[category[i] intValue] - 1];
        NSString* durationStr = duration[i];
        [dict setObject:durationStr forKey:categoryStr];
    }
    [CHSettingTool setObject:dict forKey:@"language_duration"];
}

#pragma mark - 根据翻译类型获取起步时长
+ (NSString* )getLanguageDurationByCategory:(NSString* )category{
    NSDictionary* dict = [CHSettingTool objectForKey:@"language_duration"];
    return [dict objectForKey:category];
}

#pragma mark - 设置当前登录平台:客户端/翻译端
+ (void)setTranslate:(BOOL)value{
    [CHSettingTool setObject:[NSNumber numberWithBool:value] forKey:@"isTranslate"];
}

#pragma mark - 获得当前登录平台:客户端/翻译端
+ (BOOL)getTranslate{
    return [[CHSettingTool objectForKey:@"isTranslate"] boolValue];
}

#pragma mark - 设置当前登录状态
+ (void)setLogined:(BOOL)value{
    [CHSettingTool setObject:[NSNumber numberWithBool:value] forKey:@"isLogined"];
}

#pragma mark - 获得当前登录状态
+ (BOOL)getLogined{
    return [[CHSettingTool objectForKey:@"isLogined"] boolValue];
}

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

#pragma mark - 保存翻译用户信息
+ (void)saveTranslateUserInfo:(CDTranslateUserModel* )model{
    if ([NSKeyedArchiver archiveRootObject:model toFile:CDTranslateUserInfo]){
        if (model.secretKey){
            [self saveTranslateUserToken:model.secretKey];
        }
        CDLog(@"保存成功！");
    }else{
        CDLog(@"保存失败！");
    }
}

#pragma mark - 获取翻译用户信息
+ (CDTranslateUserModel* )getTranslateUserInfo{
    CDTranslateUserModel* model = [NSKeyedUnarchiver unarchiveObjectWithFile:CDTranslateUserInfo];
    return model;
}

#pragma mark - 保存用户token
+ (void)saveUserToken:(NSString* )token{
    [CHSettingTool setObject:token forKey:@"userToken"];
}
#pragma mark - 获取用户token
+ (NSString* )getUserToken{
    return [CHSettingTool objectForKey:@"userToken"];
}

#pragma mark - 保存翻译用户token
+ (void)saveTranslateUserToken:(NSString* )token{
    [CHSettingTool setObject:token forKey:@"translateUserToken"];
}

#pragma mark - 获取翻译用户token
+ (NSString* )getTranslateUserToken{
    return [CHSettingTool objectForKey:@"translateUserToken"];
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

#pragma mark - 获取翻译端的订单详情
+ (void)translateOrder:(NSString* )orderId success:(void (^)(CDTDetailOrderModel* result))success{
    [CDCommonTool showWithStatus:@"数据加载中"];
    [CDTranslateHttpTool translateOrder:orderId success:^(CDTDetailOrderModel *result) {
        [CDCommonTool dismissHud];
        if (success){
            success(result);
        }
    } failure:^(NSError *error) {
        [CDCommonTool dismissHud];
        [CDCommonTool showErrorWithStatus:@"数据加载失败"];
    }];
}

#pragma mark - 根据订单状态获取文本信息
+ (NSString* )getMessageByStatus:(NSString* )status{
    NSString* message;
    
    
    return message;
}

@end
