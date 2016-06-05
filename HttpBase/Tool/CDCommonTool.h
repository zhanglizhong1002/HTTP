//
//  CDCommonTool.h
//  eTianXia
//
//  Created by 陈浩 on 16/4/14.
//  Copyright © 2016年 PoBo_mac. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  CDCommonTool 于业务相关的公用工具类
 */
@interface CDCommonTool : NSObject

#pragma mark - 设置当前登录状态
+ (void)setLogined:(BOOL)value;
#pragma mark - 获得当前登录状态
+ (BOOL)getLogined;

/*
#pragma mark - 保存用户信息
+ (void)saveUserInfo:(User* )model;
#pragma mark - 获取用户信息
+ (User* )getUserInfo;
#pragma mark - 保存用户token
+ (void)saveUserToken:(NSString* )token;
#pragma mark - 获取用户token
+ (NSString* )getUserToken;
*/


#pragma mark - 封装SVProgressHUD的提示语
+ (void)showErrorWithStatus:(NSString* )status;
+ (void)showWithStatus:(NSString* )status;
+ (void)showSuccessWithStatus:(NSString* )status;
+ (void)dismissHud;


@end
