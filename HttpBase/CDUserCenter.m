//
//  CDUserCenter.m
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import "CDUserCenter.h"
#import "CDUserCenterModel.h"

@implementation CDUserCenter

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"datas" : [CDUserCenterModel class]};
}

@end
