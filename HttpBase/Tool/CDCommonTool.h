//
//  CDCommonTool.h
//  eTianXia
//
//  Created by 陈浩 on 16/4/14.
//  Copyright © 2016年 PoBo_mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

/**
 *  CDCommonTool 于业务相关的公用工具类
 */
@interface CDCommonTool : NSObject

#pragma mark - 保存翻译价格
+ (void)savePriceList:(NSArray* )priceList;
#pragma mark - 获取翻译价格
+ (NSArray* )getPriceList;
#pragma mark - 保存翻译起步时长数据
+ (void)saveLanguageCategory:(NSArray* )category duration:(NSArray* )duration;
#pragma mark - 根据翻译类型获取起步时长
+ (NSString* )getLanguageDurationByCategory:(NSString* )category;
#pragma mark - 设置当前登录状态
+ (void)setLogined:(BOOL)value;
#pragma mark - 获得当前登录状态
+ (BOOL)getLogined;
#pragma mark - 设置当前登录平台:客户端/翻译端
+ (void)setTranslate:(BOOL)value;
#pragma mark - 获得当前登录平台:客户端/翻译端
+ (BOOL)getTranslate;
#pragma mark - 保存用户信息
+ (void)saveUserInfo:(User* )model;
#pragma mark - 获取用户信息
+ (User* )getUserInfo;
#pragma mark - 保存用户token
+ (void)saveUserToken:(NSString* )token;
#pragma mark - 获取用户token
+ (NSString* )getUserToken;

#pragma mark - 保存翻译用户信息
+ (void)saveTranslateUserInfo:(CDTranslateUserModel* )model;
#pragma mark - 获取翻译用户信息
+ (CDTranslateUserModel* )getTranslateUserInfo;
#pragma mark - 保存翻译用户token
+ (void)saveTranslateUserToken:(NSString* )token;
#pragma mark - 获取翻译用户token
+ (NSString* )getTranslateUserToken;

#pragma mark - 封装SVProgressHUD的提示语
+ (void)showErrorWithStatus:(NSString* )status;
+ (void)showWithStatus:(NSString* )status;
+ (void)showSuccessWithStatus:(NSString* )status;
+ (void)dismissHud;

#pragma mark - 获取翻译端的订单详情
+ (void)translateOrder:(NSString* )orderId success:(void (^)(CDTDetailOrderModel* result))success;

#pragma mark - 根据订单状态获取文本信息
+ (NSString* )getMessageByStatus:(NSString* )status;

@end
