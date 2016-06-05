//
//  CDBaseParseJson.m
//  UQIGOU
//
//  Created by 陈浩 on 16/1/10.
//  Copyright © 2016年 huierman. All rights reserved.
//

#import "CDBaseParseJson.h"
#import "AppDelegate.h"
#import "AFNetworking.h"


@implementation CDBaseParseJson

static dispatch_once_t onceToken;
static AFHTTPRequestOperationManager *sharedClient = nil;
static AFHTTPRequestOperationManager *sharedClient1 = nil;

+ (AFHTTPRequestOperationManager *)sharedClient{
    dispatch_once(&onceToken, ^{
        sharedClient = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseRequestUrl]];
        sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        sharedClient.requestSerializer.timeoutInterval = 10.0f;
        sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return sharedClient;
}


+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *))failure
{
    [[self sharedClient] POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        CDLog(@"error==%@",error.localizedDescription);
//        [CDCommonTool dismissHud];
        if (failure) {
            failure(error);
        }
    }];
}



+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params images:(NSArray *)images success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    [[self sharedClient] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (images && images.count > 0){
            NSMutableArray* formDataArray = [self getFormDataArrByImageArr:images];
            for (CDFormData* myFormData in formDataArray) {
                [formData appendPartWithFileData:myFormData.data
                                            name:myFormData.name
                                        fileName:myFormData.filename
                                        mimeType:myFormData.mimeType];
            }
        }
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSMutableArray* )getFormDataArrByImageArr:(NSArray* )images{
    NSMutableArray* formDataArray = [NSMutableArray array];
    for (UIImage *image in images) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@%zi.png", str,arc4random_uniform(100000)];
        
        CDFormData *formData = [[CDFormData alloc] init];
        formData.data = UIImageJPEGRepresentation(image, 0.000001);
        formData.name = @"file";
        formData.filename = fileName;
        formData.mimeType = @"image/jpeg";
        [formDataArray addObject:formData];
    }
    return formDataArray;
}

@end

@implementation CDFormData

@end
