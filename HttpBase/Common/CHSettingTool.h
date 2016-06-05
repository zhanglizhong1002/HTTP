//
//  CHSettingTool.h
//  号外 - CH
//
//  Created by ch736419929 on 15/1/6.
//  Copyright (c) 2015年 CH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHSettingTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
+ (BOOL)boolForKey:(NSString *)defaultName;

@end
