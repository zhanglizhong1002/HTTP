//
//  CDStatusTool.h
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDVersionModel.h"
#import "CDUserCenter.h"

@interface CDStatusTool : NSObject

#pragma mark - 获取通知消息
+ (void)getNoticeSuccess:(void (^)(CDUserCenter* result))success failure:(void (^)(NSError *error))failure;

#pragma mark - 获取最新版本
+ (void)getLastVersionSuccess:(void (^)(CDVersionModel* result))success failure:(void (^) (NSError* error))failure;

@end
