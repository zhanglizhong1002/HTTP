//
//  CDVersionModel.h
//  UQIGOU
//
//  Created by 陈浩 on 16/3/23.
//  Copyright © 2016年 HEM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDVersionModel : NSObject

@property (nonatomic , copy) NSString* version;//版本号
@property (nonatomic , copy) NSString* url;//新版下载地址
@property(nonatomic,assign) int model;//是否强制升级,1 强制 0不强制

@end
