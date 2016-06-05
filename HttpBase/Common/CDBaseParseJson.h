//
//  CDBaseParseJson.h
//  UQIGOU
//
//  Created by 陈浩 on 16/1/10.
//  Copyright © 2016年 huierman. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyBaseCallBack)(NSDictionary* dict);
typedef void (^MyFailureBlock) (NSError* error);

@interface CDBaseParseJson : NSObject

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formDataArray  存放图片数组
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params images:(NSArray *)images success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end

/**
 *  用来封装文件数据的模型
 */
@interface CDFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;
@end
