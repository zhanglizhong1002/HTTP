//
//  CDBaseResult.h
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDBaseResult : NSObject

@property (nonatomic , copy) NSString* code;
@property (nonatomic , copy) NSString* msg;
@property (nonatomic , strong) NSArray * datas;

@end
